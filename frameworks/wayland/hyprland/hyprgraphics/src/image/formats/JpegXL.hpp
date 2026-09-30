#pragma once

#include <cairo/cairo.h>
#include <string>
#include <expected>

namespace JXL {
    std::expected<cairo_surface_t*, std::string> createSurfaceFromJXL(const std::string&);
};
