#pragma once

#include <cairo/cairo.h>
#include <string>
#include <expected>

namespace BMP {
    std::expected<cairo_surface_t*, std::string> createSurfaceFromBMP(const std::string&);
};