# Makefile — GUI toolchain smoke test for Kan-Linux
#
#   make            build all 4 programs into build/
#   make run        launch each program for 3 seconds (auto-quit) to verify it runs
#   make run-gtk4   run a single program (no auto-quit; close the window to end)
#   make versions   print toolchain / library versions
#   make clean      clean up
#
# Dependencies: gcc/g++ make pkg-config gtk4 gtk+-3.0 Qt6Widgets Qt6Quick Qt6Qml

CC       := gcc
CXX      := g++
PKG_CONF := pkg-config
BUILD    := build

CFLAGS   := -O2 -g -Wall -Wextra
CXXFLAGS := -O2 -g -Wall -Wextra -std=c++17

GTK4_CFLAGS := $(shell $(PKG_CONF) --cflags gtk4)
GTK4_LIBS   := $(shell $(PKG_CONF) --libs gtk4)
GTK3_CFLAGS := $(shell $(PKG_CONF) --cflags gtk+-3.0)
GTK3_LIBS   := $(shell $(PKG_CONF) --libs gtk+-3.0)
QT_W_CFLAGS := $(shell $(PKG_CONF) --cflags Qt6Widgets Qt6Gui Qt6Core)
QT_W_LIBS   := $(shell $(PKG_CONF) --libs Qt6Widgets Qt6Gui Qt6Core)
QT_Q_CFLAGS := $(shell $(PKG_CONF) --cflags Qt6Quick Qt6Qml Qt6Gui Qt6Core)
QT_Q_LIBS   := $(shell $(PKG_CONF) --libs Qt6Quick Qt6Qml Qt6Gui Qt6Core)

APPS := $(BUILD)/gtk4_app $(BUILD)/gtk3_app \
        $(BUILD)/qt_widgets_app $(BUILD)/qt_quick_app

.PHONY: all run run-gtk4 run-gtk3 run-qt-widgets run-qt-quick \
        versions deps check clean

all: $(APPS)
	@echo "BUILD OK: $(notdir $(APPS))"

$(BUILD):
	mkdir -p $(BUILD)

# ---- GTK4 (C) ----
$(BUILD)/gtk4_app: gtk4_app.c | $(BUILD)
	$(CC) $(CFLAGS) $(GTK4_CFLAGS) -o $@ $< $(GTK4_LIBS) -lm

# ---- GTK3 (C) ----
$(BUILD)/gtk3_app: gtk3_app.c | $(BUILD)
	$(CC) $(CFLAGS) $(GTK3_CFLAGS) -o $@ $< $(GTK3_LIBS) -lm

# ---- Qt6 Widgets (C++) ----
$(BUILD)/qt_widgets_app: qt_widgets_app.cpp | $(BUILD)
	$(CXX) $(CXXFLAGS) $(QT_W_CFLAGS) -o $@ $< $(QT_W_LIBS)

# ---- Qt6 Quick/QML (C++) ----
$(BUILD)/qt_quick_app: qt_quick_app.cpp | $(BUILD)
	$(CXX) $(CXXFLAGS) $(QT_Q_CFLAGS) -o $@ $< $(QT_Q_LIBS)

# ---- run test: each program auto-exits via --seconds ----
SECONDS ?= 3

run: all
	@fail=0; \
	for app in $(APPS); do \
	    name=$$(basename $$app); \
	    echo "=== RUN $$name (timeout $(SECONDS)s) ==="; \
	    if ./$$app --seconds $(SECONDS); then \
	        echo "--- PASS $$name"; \
	    else \
	        echo "--- FAIL $$name (exit $$?)"; fail=1; \
	    fi; \
	done; \
	if [ $$fail -eq 0 ]; then echo "ALL GUI APPS PASS"; else echo "SOME APPS FAILED"; exit 1; fi

run-gtk4: $(BUILD)/gtk4_app
	./$(BUILD)/gtk4_app

run-gtk3: $(BUILD)/gtk3_app
	./$(BUILD)/gtk3_app

run-qt-widgets: $(BUILD)/qt_widgets_app
	./$(BUILD)/qt_widgets_app

run-qt-quick: $(BUILD)/qt_quick_app
	./$(BUILD)/qt_quick_app

# ---- environment info ----
versions deps:
	@echo "== Kan-Linux GUI development environment =="
	@echo "kernel:   $$(uname -r)"
	@echo "gcc:      $$(gcc --version | head -1)"
	@echo "g++:      $$(g++ --version | head -1)"
	@echo "make:     $$(make --version | head -1)"
	@echo "pkg-conf: $$(pkg-config --version)"
	@echo "gtk4:     $$($(PKG_CONF) --modversion gtk4 2>/dev/null || echo missing)"
	@echo "gtk3:     $$($(PKG_CONF) --modversion gtk+-3.0 2>/dev/null || echo missing)"
	@echo "Qt6:      $$(qmake6 -query QT_VERSION 2>/dev/null || echo missing)"
	@echo "Qt6Widgets:  $$($(PKG_CONF) --modversion Qt6Widgets 2>/dev/null || echo missing)"
	@echo "Qt6Quick:    $$($(PKG_CONF) --modversion Qt6Quick 2>/dev/null || echo missing)"
	@echo "Qt6Qml:      $$($(PKG_CONF) --modversion Qt6Qml 2>/dev/null || echo missing)"
	@echo "DISPLAY:  $${DISPLAY:-<unset>}  WAYLAND_DISPLAY: $${WAYLAND_DISPLAY:-<unset>}"

check: run versions

clean:
	rm -rf $(BUILD)
