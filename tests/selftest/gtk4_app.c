/* gtk4_app.c — GTK4 GUI smoke test for Kan-Linux
 * Build:  make build/gtk4_app
 * Run:    ./build/gtk4_app [--seconds N]
 */
#include <gtk/gtk.h>
#include <math.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

typedef struct {
    GtkApplication *app;
    GtkWidget      *draw;
    GtkWidget      *status;
    GtkWidget      *level;
    guint           clicks;
    double          phase;
} App;

static gboolean on_tick(gpointer data)
{
    App *a = data;
    a->phase += 0.06;
    gtk_widget_queue_draw(a->draw);
    gtk_level_bar_set_value(GTK_LEVEL_BAR(a->level),
                           0.5 + 0.5 * sin(a->phase));
    return G_SOURCE_CONTINUE;
}

static void on_draw(GtkDrawingArea *area, cairo_t *cr,
                    int width, int height, gpointer data)
{
    App *a = data;
    (void)area;

    cairo_set_source_rgb(cr, 0.10, 0.12, 0.18);
    cairo_paint(cr);

    double cx = width  / 2.0 + (width  / 3.5) * sin(a->phase);
    double cy = height / 2.0 + (height / 3.5) * cos(a->phase * 0.8);
    double r  = (width < height ? width : height) / 8.0;

    cairo_arc(cr, cx, cy, r, 0, 2 * G_PI);
    cairo_set_source_rgb(cr, 0.35, 0.65, 1.0);
    cairo_fill(cr);

    cairo_arc(cr, cx, cy, r * 0.55, 0, 2 * G_PI);
    cairo_set_source_rgb(cr, 0.85, 0.92, 1.0);
    cairo_fill(cr);

    cairo_set_source_rgb(cr, 0.85, 0.87, 0.92);
    cairo_set_line_width(cr, 2);
    cairo_rectangle(cr, 2, 2, width - 4, height - 4);
    cairo_stroke(cr);
}

static void on_clicked(GtkButton *btn, gpointer data)
{
    App *a = data;
    char buf[128];
    (void)btn;

    a->clicks++;
    g_snprintf(buf, sizeof buf,
               "Button clicked %u times | GTK %u.%u.%u | Wayland rendering OK",
               a->clicks,
               gtk_get_major_version(),
               gtk_get_minor_version(),
               gtk_get_micro_version());
    gtk_label_set_text(GTK_LABEL(a->status), buf);
}

static gboolean on_quit_timeout(gpointer data)
{
    App *a = data;
    g_print("OK: gtk4_app auto-quit after timeout\n");
    g_application_quit(G_APPLICATION(a->app));
    return G_SOURCE_REMOVE;
}

static void activate(GtkApplication *gtk_app, gpointer user_data)
{
    int seconds = GPOINTER_TO_INT(user_data);
    App *a = g_new0(App, 1);
    a->app = gtk_app;

    GtkWidget *window = gtk_application_window_new(gtk_app);
    gtk_window_set_title(GTK_WINDOW(window), "Kan-Linux GTK4 Test");
    gtk_window_set_default_size(GTK_WINDOW(window), 480, 380);

    GtkWidget *header = gtk_header_bar_new();
    gtk_header_bar_set_title_widget(GTK_HEADER_BAR(header),
                                    gtk_label_new("GTK4 Demo"));
    gtk_window_set_titlebar(GTK_WINDOW(window), header);

    GtkWidget *vbox = gtk_box_new(GTK_ORIENTATION_VERTICAL, 10);
    gtk_widget_set_margin_top(vbox, 12);
    gtk_widget_set_margin_bottom(vbox, 12);
    gtk_widget_set_margin_start(vbox, 12);
    gtk_widget_set_margin_end(vbox, 12);

    a->status = gtk_label_new("GTK4 ready — click the button to test signals and font rendering");
    gtk_label_set_wrap(GTK_LABEL(a->status), TRUE);
    gtk_box_append(GTK_BOX(vbox), a->status);

    GtkWidget *button = gtk_button_new_with_label("Click me");
    g_signal_connect(button, "clicked", G_CALLBACK(on_clicked), a);
    gtk_box_append(GTK_BOX(vbox), button);

    GtkWidget *entry = gtk_entry_new();
    gtk_entry_set_placeholder_text(GTK_ENTRY(entry), "Text entry test");
    gtk_box_append(GTK_BOX(vbox), entry);

    GtkWidget *check = gtk_check_button_new_with_label("Check button");
    gtk_check_button_set_active(GTK_CHECK_BUTTON(check), TRUE);
    gtk_box_append(GTK_BOX(vbox), check);

    GtkWidget *level_lbl = gtk_label_new("Animated level bar");
    gtk_box_append(GTK_BOX(vbox), level_lbl);
    a->level = gtk_level_bar_new();
    gtk_level_bar_set_value(GTK_LEVEL_BAR(a->level), 0.5);
    gtk_box_append(GTK_BOX(vbox), a->level);

    a->draw = gtk_drawing_area_new();
    gtk_drawing_area_set_draw_func(GTK_DRAWING_AREA(a->draw),
                                   on_draw, a, NULL);
    gtk_widget_set_vexpand(a->draw, TRUE);
    gtk_widget_set_size_request(a->draw, -1, 140);
    gtk_box_append(GTK_BOX(vbox), a->draw);

    gtk_window_set_child(GTK_WINDOW(window), vbox);
    gtk_window_present(GTK_WINDOW(window));

    g_timeout_add(16, on_tick, a);
    if (seconds > 0)
        g_timeout_add_seconds((guint)seconds, on_quit_timeout, a);
}

/* strip our own "--seconds N" so GApplication doesn't reject it */
static int take_seconds(int *argc, char ***argv)
{
    int seconds = 0, out = 1, i;
    char **argv2 = g_new0(char *, *argc + 1);

    argv2[0] = (*argv)[0];
    for (i = 1; i < *argc; i++) {
        if (g_strcmp0((*argv)[i], "--seconds") == 0 && i + 1 < *argc) {
            seconds = atoi((*argv)[++i]);
        } else if (g_strcmp0((*argv)[i], "--help") == 0) {
            g_print("Usage: %s [--seconds N]\n", (*argv)[0]);
            exit(0);
        } else {
            argv2[out++] = (*argv)[i];
        }
    }
    *argc = out;
    *argv = argv2;
    return seconds;
}

int main(int argc, char **argv)
{
    int seconds = take_seconds(&argc, &argv);

    g_print("INFO: gtk4_app starting (GTK %u.%u.%u)\n",
            gtk_get_major_version(),
            gtk_get_minor_version(),
            gtk_get_micro_version());

    GtkApplication *app = gtk_application_new("org.kanlinux.gtk4demo",
                                              G_APPLICATION_DEFAULT_FLAGS);
    g_signal_connect(app, "activate", G_CALLBACK(activate),
                     GINT_TO_POINTER(seconds));

    int status = g_application_run(G_APPLICATION(app), argc, argv);
    g_object_unref(app);

    if (status == 0)
        g_print("OK: gtk4_app exited cleanly\n");
    return status;
}
