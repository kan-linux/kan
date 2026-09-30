#pragma once

#include <cairo/cairo.h>
#include <string>
#include <expected>

namespace WEBP {
    std::expected<cairo_surface_t*, std::string> createSurfaceFromWEBP(const std::string&);
};
