#pragma once

#include <cairo/cairo.h>
#include <string>
#include <jpeglib.h>
#include <expected>

namespace JPEG {
    std::expected<cairo_surface_t*, std::string> createSurfaceFromJPEG(const std::string&);
};