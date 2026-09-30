/*
 * lightdm-greeter-wayland - Wayland client greeter for LightDM
 *
 * Runs as a Wayland client inside Hyprland (or any Wayland compositor).
 * Uses wl_shm + cairo for rendering, wl_seat for keyboard input,
 * liblightdm-gobject for LightDM authentication.
 *
 * Build: see Makefile
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <fcntl.h>
#include <signal.h>
#include <time.h>
#include <errno.h>
#include <ctype.h>
#include <sys/mman.h>

#include <wayland-client.h>
#include <cairo.h>
#include <lightdm.h>

/* ---- Configuration ---- */
#define WIN_W 480
#define WIN_H 400
#define BG_R 0.12
#define BG_G 0.14
#define BG_B 0.18
#define ACCENT_R 0.30
#define ACCENT_G 0.60
#define ACCENT_B 0.90
#define TEXT_R 0.90
#define TEXT_G 0.92
#define TEXT_B 0.95
#define USER_BOX_W 280
#define USER_BOX_H 44
#define USER_BOX_GAP 6
#define INPUT_W 280
#define INPUT_H 32
#define CURSOR_BLINK_MS 500

/* ---- Wayland globals ---- */
struct wl_globals {
    struct wl_display *display;
    struct wl_registry *registry;
    struct wl_compositor *compositor;
    struct wl_shm *shm;
    struct wl_shell *shell;
    struct wl_seat *seat;
    struct wl_keyboard *keyboard;
    struct wl_surface *surface;
    struct wl_shell_surface *shell_surface;
    struct wl_shm_pool *pool;
    void *pool_data;
    int pool_fd;
    int pool_size;
    struct wl_buffer *buffer;
    void *buffer_data;
    int width, height;
    int configured;
};

/* ---- Greeter state ---- */
struct greeter {
    struct wl_globals wl;
    LightDMGreeter *ldm;
    GList *users;
    int selected;
    char password[256];
    int pw_len;
    int auth_pending;
    char status[256];
    int cursor_visible;
    struct timespec last_blink;
    int running;
    int needs_redraw;
};

static struct greeter *G = NULL;

/* ---- Shared memory ---- */
static int
create_shm_file(int size)
{
    char path[] = "/tmp/wayland-shm-XXXXXX";
    int fd = mkstemp(path);
    if (fd < 0) return -1;
    unlink(path);
    if (ftruncate(fd, size) < 0) { close(fd); return -1; }
    return fd;
}

/* ---- Wayland protocol handlers ---- */

static void
shell_surface_ping(void *data, struct wl_shell_surface *ss, uint32_t serial)
{
    wl_shell_surface_pong(ss, serial);
}

static void
shell_surface_configure(void *data, struct wl_shell_surface *ss,
                        uint32_t edges, int32_t w, int32_t h)
{
    /* Accept compositor's size */
}

static void
shell_surface_popup_done(void *data, struct wl_shell_surface *ss)
{
}

static const struct wl_shell_surface_listener shell_surface_listener = {
    .ping = shell_surface_ping,
    .configure = shell_surface_configure,
    .popup_done = shell_surface_popup_done,
};

static void
keyboard_keymap(void *data, struct wl_keyboard *kb, uint32_t format,
                int32_t fd, uint32_t size)
{
    close(fd);
}

static void
keyboard_enter(void *data, struct wl_keyboard *kb, uint32_t serial,
               struct wl_surface *surface, struct wl_array *keys)
{
}

static void
keyboard_leave(void *data, struct wl_keyboard *kb, uint32_t serial,
               struct wl_surface *surface)
{
}

static void
keyboard_key(void *data, struct wl_keyboard *kb, uint32_t serial,
             uint32_t time, uint32_t key, uint32_t state)
{
    struct greeter *g = data;
    if (state != WL_KEYBOARD_KEY_STATE_PRESSED) return;

    /* Linux evdev keycode offset */
    uint32_t code = key + 8;

    switch (code) {
    case 98+8: /* KEY_UP = 103, -8 = 95... use raw */ break;
    default: break;
    }

    /* Map evdev keycodes (same as DRM version, offset by 8) */
    uint32_t evdev = code;
    switch (evdev) {
    case 103: /* KEY_UP */
        if (g->selected > 0) {
            g->selected--;
            g->pw_len = 0; g->password[0] = 0; g->status[0] = 0;
        }
        break;
    case 108: /* KEY_DOWN */
        if (g->selected < (int)g_list_length(g->users) - 1) {
            g->selected++;
            g->pw_len = 0; g->password[0] = 0; g->status[0] = 0;
        }
        break;
    case 28: /* KEY_ENTER */
    case 96: /* KEY_KPENTER */
        if (g->selected >= 0 && !g->auth_pending) {
            LightDMUser *user = g_list_nth_data(g->users, g->selected);
            if (user) {
                g->auth_pending = 1; g->status[0] = 0;
                lightdm_greeter_authenticate(g->ldm, lightdm_user_get_name(user), NULL);
                if (g->pw_len > 0)
                    lightdm_greeter_respond(g->ldm, g->password, NULL);
            }
        }
        break;
    case 14: /* KEY_BACKSPACE */
        if (g->pw_len > 0) {
            g->pw_len--;
            g->password[g->pw_len] = 0;
            g->cursor_visible = 1;
            clock_gettime(CLOCK_MONOTONIC, &g->last_blink);
        }
        break;
    case 1: /* KEY_ESC */
        if (g->auth_pending) {
            lightdm_greeter_cancel_authentication(g->ldm, NULL);
            g->auth_pending = 0;
        }
        g->pw_len = 0; g->password[0] = 0; g->status[0] = 0;
        break;
    default: {
        /* Simple US layout mapping */
        static const char m1[] = "1234567890-=";
        static const char m2[] = "qwertyuiop[]";
        static const char m3[] = "asdfghjkl;'";
        static const char m4[] = "zxcvbnm,./";
        char ch = 0;
        if (evdev >= 2 && evdev <= 13) ch = m1[evdev - 2];
        else if (evdev == 13) ch = '=';
        else if (evdev >= 16 && evdev <= 27) ch = m2[evdev - 16];
        else if (evdev >= 30 && evdev <= 40) ch = m3[evdev - 30];
        else if (evdev >= 44 && evdev <= 53) ch = m4[evdev - 44];
        else if (evdev == 57) ch = ' ';
        if (ch && g->pw_len < (int)sizeof(g->password) - 1) {
            g->password[g->pw_len++] = ch;
            g->password[g->pw_len] = 0;
            g->cursor_visible = 1;
            clock_gettime(CLOCK_MONOTONIC, &g->last_blink);
        }
    } break;
    }
    g->needs_redraw = 1;
}

static void
keyboard_modifiers(void *data, struct wl_keyboard *kb, uint32_t serial,
                   uint32_t mods_depressed, uint32_t mods_latched,
                   uint32_t mods_locked, uint32_t group)
{
}

static void
keyboard_repeat_info(void *data, struct wl_keyboard *kb,
                     int32_t rate, int32_t delay)
{
}

static const struct wl_keyboard_listener keyboard_listener = {
    .keymap = keyboard_keymap,
    .enter = keyboard_enter,
    .leave = keyboard_leave,
    .key = keyboard_key,
    .modifiers = keyboard_modifiers,
    .repeat_info = keyboard_repeat_info,
};

static void
seat_capabilities(void *data, struct wl_seat *seat, uint32_t caps)
{
    struct greeter *g = data;
    if (caps & WL_SEAT_CAPABILITY_KEYBOARD) {
        g->wl.keyboard = wl_seat_get_keyboard(seat);
        wl_keyboard_add_listener(g->wl.keyboard, &keyboard_listener, g);
    }
}

static void
seat_name(void *data, struct wl_seat *seat, const char *name)
{
}

static const struct wl_seat_listener seat_listener = {
    .capabilities = seat_capabilities,
    .name = seat_name,
};

static void
shm_format(void *data, struct wl_shm *shm, uint32_t format)
{
}

static const struct wl_shm_listener shm_listener = {
    .format = shm_format,
};

static void
buffer_release(void *data, struct wl_buffer *buffer)
{
    /* Buffer can be reused */
}

static const struct wl_buffer_listener buffer_listener = {
    .release = buffer_release,
};

static void
registry_global(void *data, struct wl_registry *reg, uint32_t name,
                const char *interface, uint32_t version)
{
    struct greeter *g = data;

    if (strcmp(interface, "wl_compositor") == 0) {
        g->wl.compositor = wl_registry_bind(reg, name, &wl_compositor_interface, 1);
    } else if (strcmp(interface, "wl_shm") == 0) {
        g->wl.shm = wl_registry_bind(reg, name, &wl_shm_interface, 1);
        wl_shm_add_listener(g->wl.shm, &shm_listener, g);
    } else if (strcmp(interface, "wl_shell") == 0) {
        g->wl.shell = wl_registry_bind(reg, name, &wl_shell_interface, 1);
    } else if (strcmp(interface, "wl_seat") == 0) {
        g->wl.seat = wl_registry_bind(reg, name, &wl_seat_interface, 1);
        wl_seat_add_listener(g->wl.seat, &seat_listener, g);
    }
}

static void
registry_global_remove(void *data, struct wl_registry *reg, uint32_t name)
{
}

static const struct wl_registry_listener registry_listener = {
    .global = registry_global,
    .global_remove = registry_global_remove,
};

/* ---- Wayland buffer creation ---- */

static int
create_buffer(struct greeter *g, int width, int height)
{
    int stride = width * 4;
    int size = stride * height;

    g->wl.pool_fd = create_shm_file(size);
    if (g->wl.pool_fd < 0) return -1;

    g->wl.pool_data = mmap(NULL, size, PROT_READ | PROT_WRITE, MAP_SHARED,
                            g->wl.pool_fd, 0);
    if (g->wl.pool_data == MAP_FAILED) return -1;

    g->wl.pool = wl_shm_create_pool(g->wl.shm, g->wl.pool_fd, size);
    g->wl.buffer = wl_shm_pool_create_buffer(g->wl.pool, 0, width, height,
                                              stride, WL_SHM_FORMAT_ARGB8888);
    wl_buffer_add_listener(g->wl.buffer, &buffer_listener, g);
    g->wl.buffer_data = g->wl.pool_data;
    g->wl.width = width;
    g->wl.height = height;
    g->wl.pool_size = size;

    return 0;
}

/* ---- Cairo rendering ---- */

static void
draw_rounded_rect(cairo_t *cr, double x, double y, double w, double h, double r)
{
    cairo_new_sub_path(cr);
    cairo_arc(cr, x + w - r, y + r, r, -M_PI/2, 0);
    cairo_arc(cr, x + w - r, y + h - r, r, 0, M_PI/2);
    cairo_arc(cr, x + r, y + h - r, r, M_PI/2, M_PI);
    cairo_arc(cr, x + r, y + r, r, M_PI, 3*M_PI/2);
    cairo_close_path(cr);
}

static void
render(struct greeter *g)
{
    if (!g->wl.buffer_data) return;

    cairo_surface_t *surf = cairo_image_surface_create_for_data(
        g->wl.buffer_data, CAIRO_FORMAT_ARGB32,
        g->wl.width, g->wl.height, g->wl.width * 4);
    cairo_t *cr = cairo_create(surf);
    int w = g->wl.width, h = g->wl.height;

    /* Background */
    cairo_pattern_t *bg = cairo_pattern_create_linear(0, 0, 0, h);
    cairo_pattern_add_color_stop_rgb(bg, 0, BG_R, BG_G, BG_B);
    cairo_pattern_add_color_stop_rgb(bg, 1, BG_R*0.6, BG_G*0.6, BG_B*0.6);
    cairo_set_source(cr, bg);
    cairo_paint(cr);
    cairo_pattern_destroy(bg);

    /* Title */
    cairo_select_font_face(cr, "sans", CAIRO_FONT_SLANT_NORMAL, CAIRO_FONT_WEIGHT_BOLD);
    cairo_set_font_size(cr, 24);
    cairo_set_source_rgb(cr, TEXT_R, TEXT_G, TEXT_B);
    cairo_text_extents_t ext;
    cairo_text_extents(cr, "kan-linux", &ext);
    cairo_move_to(cr, (w - ext.width)/2, 50);
    cairo_show_text(cr, "kan-linux");

    /* User list */
    int user_count = g_list_length(g->users);
    if (user_count > 0) {
        int list_h = user_count * (USER_BOX_H + USER_BOX_GAP) - USER_BOX_GAP;
        int start_y = 80;
        int start_x = (w - USER_BOX_W)/2;

        GList *link; int i = 0;
        for (link = g->users; link; link = link->next, i++) {
            LightDMUser *user = link->data;
            int y = start_y + i * (USER_BOX_H + USER_BOX_GAP);
            int sel = (i == g->selected);

            /* Box */
            draw_rounded_rect(cr, start_x, y, USER_BOX_W, USER_BOX_H, 5);
            cairo_set_source_rgb(cr,
                sel ? ACCENT_R : BG_R*1.4,
                sel ? ACCENT_G : BG_G*1.4,
                sel ? ACCENT_B : BG_B*1.4);
            cairo_fill(cr);

            /* Avatar circle */
            cairo_arc(cr, start_x + 20, y + USER_BOX_H/2, 12, 0, 2*M_PI);
            cairo_set_source_rgba(cr, ACCENT_R, ACCENT_G, ACCENT_B, sel ? 0.5 : 0.2);
            cairo_fill(cr);

            /* Avatar letter */
            const char *name = lightdm_user_get_display_name(user);
            if (!name || !*name) name = lightdm_user_get_name(user);
            if (name && *name) {
                char letter[2] = {toupper(name[0]), 0};
                cairo_select_font_face(cr, "sans", CAIRO_FONT_SLANT_NORMAL, CAIRO_FONT_WEIGHT_BOLD);
                cairo_set_font_size(cr, 11);
                cairo_text_extents_t le;
                cairo_text_extents(cr, letter, &le);
                cairo_set_source_rgb(cr, TEXT_R, TEXT_G, TEXT_B);
                cairo_move_to(cr, start_x + 20 - le.width/2 - le.x_bearing,
                              y + USER_BOX_H/2 - le.height/2 - le.y_bearing);
                cairo_show_text(cr, letter);
            }

            /* Username */
            const char *uname = lightdm_user_get_name(user);
            if (uname) {
                cairo_select_font_face(cr, "sans", CAIRO_FONT_SLANT_NORMAL, CAIRO_FONT_WEIGHT_NORMAL);
                cairo_set_font_size(cr, 13);
                cairo_set_source_rgb(cr, TEXT_R, TEXT_G, TEXT_B);
                cairo_move_to(cr, start_x + 40, y + USER_BOX_H/2 + 4);
                cairo_show_text(cr, uname);
            }
        }

        /* Password field */
        int fy = start_y + list_h + 15;
        int fx = (w - INPUT_W)/2;

        cairo_set_font_size(cr, 10);
        cairo_set_source_rgba(cr, TEXT_R, TEXT_G, TEXT_B, 0.5);
        cairo_move_to(cr, fx, fy - 5);
        cairo_show_text(cr, "Password");

        draw_rounded_rect(cr, fx, fy, INPUT_W, INPUT_H, 4);
        cairo_set_source_rgb(cr, 0.06, 0.07, 0.10);
        cairo_fill(cr);
        draw_rounded_rect(cr, fx, fy, INPUT_W, INPUT_H, 4);
        cairo_set_source_rgba(cr, ACCENT_R, ACCENT_G, ACCENT_B, 0.4);
        cairo_set_line_width(cr, 1.0);
        cairo_stroke(cr);

        /* Password text */
        if (g->pw_len > 0) {
            char mask[256];
            int len = g->pw_len < 255 ? g->pw_len : 255;
            memset(mask, '*', len); mask[len] = 0;
            cairo_set_font_size(cr, 12);
            cairo_set_source_rgb(cr, TEXT_R, TEXT_G, TEXT_B);
            cairo_move_to(cr, fx + 8, fy + INPUT_H/2 + 4);
            cairo_show_text(cr, mask);

            if (g->cursor_visible) {
                cairo_text_extents_t ce;
                cairo_text_extents(cr, mask, &ce);
                cairo_set_source_rgb(cr, ACCENT_R, ACCENT_G, ACCENT_B);
                cairo_set_line_width(cr, 1.5);
                cairo_move_to(cr, fx + 8 + ce.x_advance + 2, fy + 6);
                cairo_line_to(cr, fx + 8 + ce.x_advance + 2, fy + INPUT_H - 6);
                cairo_stroke(cr);
            }
        } else if (g->cursor_visible) {
            cairo_set_source_rgb(cr, ACCENT_R, ACCENT_G, ACCENT_B);
            cairo_set_line_width(cr, 1.5);
            cairo_move_to(cr, fx + 10, fy + 6);
            cairo_line_to(cr, fx + 10, fy + INPUT_H - 6);
            cairo_stroke(cr);
        }

        /* Status */
        if (g->status[0]) {
            cairo_set_font_size(cr, 11);
            cairo_set_source_rgba(cr, 1.0, 0.4, 0.4, 0.9);
            cairo_text_extents_t se;
            cairo_text_extents(cr, g->status, &se);
            cairo_move_to(cr, (w - se.width)/2, fy + INPUT_H + 18);
            cairo_show_text(cr, g->status);
        }
    }

    /* Hint */
    cairo_set_font_size(cr, 9);
    cairo_set_source_rgba(cr, TEXT_R, TEXT_G, TEXT_B, 0.25);
    const char *hint = "↑↓ select  Enter login  10s auto-login";
    cairo_text_extents_t he;
    cairo_text_extents(cr, hint, &he);
    cairo_move_to(cr, (w - he.width)/2, h - 15);
    cairo_show_text(cr, hint);

    cairo_destroy(cr);
    cairo_surface_destroy(surf);

    /* Attach and commit */
    wl_surface_attach(g->wl.surface, g->wl.buffer, 0, 0);
    wl_surface_damage(g->wl.surface, 0, 0, w, h);
    wl_surface_commit(g->wl.surface);
    wl_display_flush(g->wl.display);
}

/* ---- LightDM callbacks ---- */

static void on_show_prompt(LightDMGreeter *greeter, const char *text,
                           LightDMPromptType type, gpointer data) { (void)text; (void)type; }

static void on_auth_complete(LightDMGreeter *greeter, gpointer data)
{
    struct greeter *g = data;
    GError *err = NULL;
    if (lightdm_greeter_get_is_authenticated(greeter)) {
        const char *session = lightdm_greeter_get_default_session_hint(greeter);
        if (!session) session = "hyprland";
        if (!lightdm_greeter_start_session_sync(greeter, session, &err)) {
            snprintf(g->status, sizeof(g->status), "Session failed: %s",
                     err ? err->message : "unknown");
            g_clear_error(&err);
        } else {
            g->running = 0;
        }
    } else {
        snprintf(g->status, sizeof(g->status), "Authentication failed");
        g->pw_len = 0; g->password[0] = 0; g->auth_pending = 0;
    }
    g->needs_redraw = 1;
}

static void on_autologin_expired(LightDMGreeter *greeter, gpointer data)
{
    struct greeter *g = data;
    if (g->selected < 0 && g->users) g->selected = 0;
    g->needs_redraw = 1;
}

/* ---- Signal handler ---- */
static void sig_handler(int sig) { if (G) G->running = 0; }

/* ---- Main ---- */

int main(int argc, char *argv[])
{
    struct greeter g = {0};
    GError *err = NULL;

    G = &g;
    g.running = 1;
    g.selected = -1;
    g.cursor_visible = 1;
    clock_gettime(CLOCK_MONOTONIC, &g.last_blink);
    signal(SIGINT, sig_handler);
    signal(SIGTERM, sig_handler);

    /* Init LightDM */
    g.ldm = lightdm_greeter_new();
    g_signal_connect(g.ldm, "show-prompt", G_CALLBACK(on_show_prompt), &g);
    g_signal_connect(g.ldm, "authentication-complete", G_CALLBACK(on_auth_complete), &g);
    g_signal_connect(g.ldm, "autologin-timer-expired", G_CALLBACK(on_autologin_expired), &g);
    if (!lightdm_greeter_connect_to_daemon_sync(g.ldm, &err)) {
        fprintf(stderr, "LightDM: %s\n", err->message);
        g_clear_error(&err);
        return 1;
    }

    /* Get users */
    LightDMUserList *ul = lightdm_user_list_get_instance();
    g.users = lightdm_user_list_get_users(ul);
    if (g.users) g.selected = 0;

    /* Connect to Wayland */
    g.wl.display = wl_display_connect(NULL);
    if (!g.wl.display) {
        fprintf(stderr, "Failed to connect to Wayland display\n");
        return 1;
    }

    g.wl.registry = wl_display_get_registry(g.wl.display);
    wl_registry_add_listener(g.wl.registry, &registry_listener, &g);
    wl_display_roundtrip(g.wl.display);

    if (!g.wl.compositor || !g.wl.shm || !g.wl.shell) {
        fprintf(stderr, "Missing Wayland protocols\n");
        return 1;
    }

    /* Create surface */
    g.wl.surface = wl_compositor_create_surface(g.wl.compositor);
    g.wl.shell_surface = wl_shell_get_shell_surface(g.wl.shell, g.wl.surface);
    wl_shell_surface_add_listener(g.wl.shell_surface, &shell_surface_listener, &g);
    wl_shell_surface_set_toplevel(g.wl.shell_surface);
    wl_shell_surface_set_title(g.wl.shell_surface, "kan-linux login");

    /* Create buffer */
    if (create_buffer(&g, WIN_W, WIN_H) < 0) {
        fprintf(stderr, "Failed to create buffer\n");
        return 1;
    }

    /* Initial render */
    render(&g);
    printf("Greeter: %d users\n", g_list_length(g.users));

    /* Main loop */
    while (g.running) {
        /* LightDM D-Bus */
        g_main_context_iteration(g_main_context_default(), FALSE);

        /* Cursor blink */
        struct timespec now;
        clock_gettime(CLOCK_MONOTONIC, &now);
        long ms = (now.tv_sec - g.last_blink.tv_sec) * 1000 +
                  (now.tv_nsec - g.last_blink.tv_nsec) / 1000000;
        if (ms >= CURSOR_BLINK_MS) {
            g.cursor_visible = !g.cursor_visible;
            g.last_blink = now;
            g.needs_redraw = 1;
        }

        /* Redraw */
        if (g.needs_redraw) { render(&g); g.needs_redraw = 0; }

        /* Wayland events */
        wl_display_dispatch_pending(g.wl.display);
        wl_display_flush(g.wl.display);
        wl_display_roundtrip(g.wl.display);
    }

    /* Cleanup */
    if (g.wl.buffer) wl_buffer_destroy(g.wl.buffer);
    if (g.wl.pool) wl_shm_pool_destroy(g.wl.pool);
    if (g.wl.pool_data) munmap(g.wl.pool_data, g.wl.pool_size);
    if (g.wl.pool_fd >= 0) close(g.wl.pool_fd);
    if (g.wl.shell_surface) wl_shell_surface_destroy(g.wl.shell_surface);
    if (g.wl.surface) wl_surface_destroy(g.wl.surface);
    if (g.wl.keyboard) wl_keyboard_destroy(g.wl.keyboard);
    if (g.wl.seat) wl_seat_destroy(g.wl.seat);
    if (g.wl.shell) wl_shell_destroy(g.wl.shell);
    if (g.wl.shm) wl_shm_destroy(g.wl.shm);
    if (g.wl.compositor) wl_compositor_destroy(g.wl.compositor);
    wl_registry_destroy(g.wl.registry);
    wl_display_disconnect(g.wl.display);
    g_object_unref(g.ldm);

    return 0;
}