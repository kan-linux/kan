/* gtk3_app.c — GTK3 GUI smoke test for Kan-Linux
 * Build:  make build/gtk3_app
 * Run:    ./build/gtk3_app [--seconds N]
 */
#include <gtk/gtk.h>
#include <math.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

typedef struct {
    GtkWidget *status;
    GtkWidget *spin;
    GtkWidget *progress;
    GtkWidget *draw;
    GtkWidget *scale;
    guint      clicks;
    double     phase;
} App;

static gboolean on_tick(gpointer data)
{
    App *a = data;

    a->phase += 0.06;
    gtk_progress_bar_set_fraction(GTK_PROGRESS_BAR(a->progress),
                                  0.5 + 0.5 * sin(a->phase));
    gtk_widget_queue_draw(a->draw);
    return G_SOURCE_CONTINUE;
}

static gboolean on_draw(GtkWidget *widget, cairo_t *cr, gpointer data)
{
    App *a = data;
    int width  = gtk_widget_get_allocated_width(widget);
    int height = gtk_widget_get_allocated_height(widget);

    cairo_set_source_rgb(cr, 0.12, 0.16, 0.12);
    cairo_paint(cr);

    /* sine wave */
    cairo_set_source_rgb(cr, 0.5, 0.9, 0.5);
    cairo_set_line_width(cr, 2);
    cairo_move_to(cr, 0, height / 2.0);
    for (int x = 0; x <= width; x += 4) {
        double y = height / 2.0 + (height / 3.0) * sin(x / 25.0 + a->phase);
        cairo_line_to(cr, x, y);
    }
    cairo_stroke(cr);

    /* grid */
    cairo_set_source_rgb(cr, 0.25, 0.35, 0.25);
    cairo_set_line_width(cr, 1);
    for (int x = 0; x < width; x += 20) {
        cairo_move_to(cr, x, 0);
        cairo_line_to(cr, x, height);
    }
    for (int y = 0; y < height; y += 20) {
        cairo_move_to(cr, 0, y);
        cairo_line_to(cr, width, y);
    }
    cairo_stroke(cr);
    return FALSE;
}

static void on_clicked(GtkButton *btn, gpointer data)
{
    App *a = data;
    char buf[160];
    (void)btn;

    a->clicks++;
    g_snprintf(buf, sizeof buf,
               "GTK3 button clicked %u times | spin=%d | scale=%.2f | GTK %u.%u.%u",
               a->clicks,
               gtk_spin_button_get_value_as_int(GTK_SPIN_BUTTON(a->spin)),
               gtk_range_get_value(GTK_RANGE(a->scale)),
               gtk_major_version, gtk_minor_version, gtk_micro_version);
    gtk_label_set_text(GTK_LABEL(a->status), buf);
}

static gboolean on_quit_timeout(gpointer data)
{
    (void)data;
    gtk_main_quit();
    g_print("OK: gtk3_app auto-quit after timeout\n");
    return G_SOURCE_REMOVE;
}

int main(int argc, char **argv)
{
    int seconds = 0;

    for (int i = 1; i < argc; i++) {
        if (strcmp(argv[i], "--seconds") == 0 && i + 1 < argc)
            seconds = atoi(argv[++i]);
        else if (strcmp(argv[i], "--help") == 0) {
            printf("Usage: %s [--seconds N]\n", argv[0]);
            return 0;
        }
    }

    printf("INFO: gtk3_app starting (GTK %u.%u.%u)\n",
           gtk_major_version, gtk_minor_version, gtk_micro_version);

    gtk_init(&argc, &argv);

    App *a = g_new0(App, 1);

    GtkWidget *window = gtk_window_new(GTK_WINDOW_TOPLEVEL);
    gtk_window_set_title(GTK_WINDOW(window), "Kan-Linux GTK3 Test");
    gtk_window_set_default_size(GTK_WINDOW(window), 480, 400);
    g_signal_connect(window, "destroy", G_CALLBACK(gtk_main_quit), NULL);

    GtkWidget *grid = gtk_grid_new();
    gtk_grid_set_row_spacing(GTK_GRID(grid), 8);
    gtk_grid_set_column_spacing(GTK_GRID(grid), 8);
    gtk_container_set_border_width(GTK_CONTAINER(grid), 12);
    gtk_container_add(GTK_CONTAINER(window), grid);

    a->status = gtk_label_new("GTK3 ready — classic widget stack test");
    gtk_widget_set_halign(a->status, GTK_ALIGN_START);
    gtk_grid_attach(GTK_GRID(grid), a->status, 0, 0, 3, 1);

    GtkWidget *button = gtk_button_new_with_label("Click me");
    g_signal_connect(button, "clicked", G_CALLBACK(on_clicked), a);
    gtk_grid_attach(GTK_GRID(grid), button, 0, 1, 1, 1);

    a->spin = gtk_spin_button_new_with_range(0, 100, 1);
    gtk_spin_button_set_value(GTK_SPIN_BUTTON(a->spin), 42);
    gtk_grid_attach(GTK_GRID(grid), a->spin, 1, 1, 1, 1);

    GtkWidget *combo = gtk_combo_box_text_new();
    gtk_combo_box_text_append_text(GTK_COMBO_BOX_TEXT(combo), "Option 1");
    gtk_combo_box_text_append_text(GTK_COMBO_BOX_TEXT(combo), "Option 2");
    gtk_combo_box_text_append_text(GTK_COMBO_BOX_TEXT(combo), "Option 3");
    gtk_combo_box_set_active(GTK_COMBO_BOX(combo), 1);
    gtk_grid_attach(GTK_GRID(grid), combo, 2, 1, 1, 1);

    a->scale = gtk_scale_new_with_range(GTK_ORIENTATION_HORIZONTAL, 0, 1, 0.01);
    gtk_range_set_value(GTK_RANGE(a->scale), 0.3);
    gtk_grid_attach(GTK_GRID(grid), a->scale, 0, 2, 3, 1);

    a->progress = gtk_progress_bar_new();
    gtk_grid_attach(GTK_GRID(grid), a->progress, 0, 3, 3, 1);

    a->draw = gtk_drawing_area_new();
    gtk_widget_set_size_request(a->draw, -1, 160);
    g_signal_connect(a->draw, "draw", G_CALLBACK(on_draw), a);
    gtk_grid_attach(GTK_GRID(grid), a->draw, 0, 4, 3, 1);

    gtk_widget_show_all(window);

    g_timeout_add(16, on_tick, a);
    if (seconds > 0)
        g_timeout_add_seconds((guint)seconds, on_quit_timeout, NULL);

    gtk_main();

    g_print("OK: gtk3_app exited cleanly\n");
    g_free(a);
    return 0;
}
