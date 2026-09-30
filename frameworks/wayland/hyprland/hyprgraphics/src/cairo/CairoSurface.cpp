#include <hyprgraphics/cairo/CairoSurface.hpp>

using namespace Hyprgraphics;

Hyprgraphics::CCairoSurface::CCairoSurface(cairo_surface_t* surf) : pSurface(surf) {
    ;
}

Hyprgraphics::CCairoSurface::~CCairoSurface() {
    if (pSurface)
        cairo_surface_destroy(pSurface);
}

cairo_surface_t* Hyprgraphics::CCairoSurface::cairo() {
    return pSurface;
}

Hyprutils::Math::Vector2D Hyprgraphics::CCairoSurface::size() {
    return {cairo_image_surface_get_width(pSurface), cairo_image_surface_get_height(pSurface)};
}

int Hyprgraphics::CCairoSurface::status() {
    return cairo_surface_status(pSurface);
}

uint8_t* Hyprgraphics::CCairoSurface::data() {
    return (uint8_t*)cairo_image_surface_get_data(pSurface);
}

int Hyprgraphics::CCairoSurface::stride() {
    return cairo_image_surface_get_stride(pSurface);
}
