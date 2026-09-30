# lightdm-greeter-wayland Makefile
# Wayland client greeter for LightDM (runs inside Hyprland)

CC ?= gcc
PKG_CONFIG ?= pkg-config

CFLAGS ?= -O2 -Wall -Wextra -Wno-unused-parameter -D_GNU_SOURCE -Wno-error
LDFLAGS ?=

PKG_CONFIG_PATH ?=
PKG_CONFIG_SYSROOT_DIR ?=

PKG_NAMES = liblightdm-gobject-1 cairo wayland-client glib-2.0 gio-2.0

ALL_CFLAGS = $(CFLAGS) $(shell PKG_CONFIG_PATH=$(PKG_CONFIG_PATH) PKG_CONFIG_SYSROOT_DIR=$(PKG_CONFIG_SYSROOT_DIR) $(PKG_CONFIG) --cflags $(PKG_NAMES))
ALL_LIBS = $(LDFLAGS) $(shell PKG_CONFIG_PATH=$(PKG_CONFIG_PATH) PKG_CONFIG_SYSROOT_DIR=$(PKG_CONFIG_SYSROOT_DIR) $(PKG_CONFIG) --libs $(PKG_NAMES)) -lm

PREFIX ?= /usr
BINDIR ?= $(PREFIX)/bin
DATADIR ?= $(PREFIX)/share

TARGET = lightdm-greeter-wayland
SRC = greeter.c

.PHONY: all clean install

all: $(TARGET)

$(TARGET): $(SRC)
	$(CC) $(ALL_CFLAGS) -o $@ $< $(ALL_LIBS)

clean:
	rm -f $(TARGET)

install: $(TARGET)
	install -D -m 755 $(TARGET) $(DESTDIR)$(BINDIR)/$(TARGET)
	install -D -m 755 greeter-wrapper.sh $(DESTDIR)$(BINDIR)/lightdm-greeter-wrapper
	install -D -m 644 lightdm-greeter-wayland.desktop \
		$(DESTDIR)$(DATADIR)/lightdm/greeters/lightdm-greeter-wayland.desktop