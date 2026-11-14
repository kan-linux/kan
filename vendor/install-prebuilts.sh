#!/bin/bash
# Download and install the Go, Rust, Oracle JDK and LunarG Vulkan SDK
#
# Download and update the Firefox, MiMoCode and LibreOffice official-binary prebuilts.
#
# Runs as root on a Kan-Linux system (VM or bare metal), either manually by
# the user or by the built-in agent. x86_64 Linux only. Toolchains/apps come
# from the official release tarballs and are installed under /opt so they
# stay separate from the base system. PATH is a rootfs convention
# (already includes /opt/go/bin, /opt/rust/*, /opt/vulkan/bin), so no
# environment setup is needed after install.
#
# Conventions (convention over configuration - the script never prompts):
#   - Must run as root; otherwise it prints an error and exits.
#   - No-arg default installs the three toolchains in one pass: go, jdk, rust
#     (that order - rust is the slowest download, so go and jdk are ready
#     first). install adds vulkan to the set (go, jdk, vulkan, rust). update
#     is the app pass: download and update the three prebuilts (firefox,
#     mimocode, libreoffice).
#   - If an install directory already exists it is removed first, then the
#     tarball is downloaded (frees disk before the download). No confirmation.
#     This includes Firefox: it ships preinstalled with the OS but is replaced
#     like every other target (setup_firefox_config re-applies its config).
#   - Free space is checked before any download: about 10G must be free on the
#     /opt filesystem, otherwise the run refuses up front.
#   - All deletions go through safe_rm_rf: empty/relative/..// paths and
#     anything outside the /opt tool roots + this run's scratch dir are
#     refused outright (a root rm -rf must never touch the system).
#
# Official distribution URLs only (go.dev, static.rust-lang.org,
# download-installer.cdn.mozilla.net, github.com/XiaomiMiMo/MiMo-Code,
# sdk.lunarg.com, download.oracle.com). No third-party mirrors.
set -euo pipefail

GO_DEFAULT_VERSION=1.27.4
RUST_DEFAULT_VERSION=1.100.0
FIREFOX_DEFAULT_VERSION=160.0
MIMOCODE_DEFAULT_VERSION=0.1.16
#unexpected issue for /opt/vulkan/bin/vulkanCapsViewer with higher version
VULKAN_DEFAULT_VERSION=1.4.304.1
JDK_DEFAULT_VERSION=27.0.1.0.3
LIBREOFFICE_DEFAULT_VERSION=26.8.3.1

GO_ROOT=/opt/go
RUST_ROOT=/opt/rust
FIREFOX_ROOT=/opt/firefox
MIMOCODE_ROOT=/opt/mimocode
VULKAN_ROOT=/opt/vulkan
JDK_ROOT=/opt/jdk
# LibreOffice installs under a versioned dir (/opt/libreoffice26.8, ...) —
# exact name is discovered from the AppImage at install time.
LIBREOFFICE_ROOT_PREFIX=/opt/libreoffice

log()  { echo "[install-prebuilts] $*"; }
die()  { echo "[install-prebuilts] ERROR: $*" >&2; exit 1; }

usage() {
    cat <<'EOF'
Usage: install-prebuilts.sh [install|update|go|rust|firefox|mimocode|vulkan|jdk|libreoffice] [--version <ver>]

  (no args)    Download and install the three toolchains: go, jdk and rust
  install      Download and install the four toolchains:  go, jdk, rust and vulkan
  update       Download and update the three prebuilts:   firefox, mimocode and libreoffice
  go           Install the Go toolchain to       /opt/go
  rust         Install the Rust toolchain to     /opt/rust
  jdk          Install the Oracle JDK to         /opt/jdk
  vulkan       Install the LunarG Vulkan SDK to  /opt/vulkan
  firefox      Update Firefox at                 /opt/firefox
  mimocode     Update MiMoCode at                /opt/mimocode
  libreoffice  Update LibreOffice at             /opt/libreoffice<ver>

Options:
  --version <ver>   Pin a release; must follow a specific target (go, rust,
                    jdk, vulkan, firefox, mimocode, libreoffice)

Examples:
  install-prebuilts.sh
  install-prebuilts.sh install
  install-prebuilts.sh update
  install-prebuilts.sh firefox
  install-prebuilts.sh firefox --version 160.0
  install-prebuilts.sh go --version 1.27.4
  install-prebuilts.sh rust --version 1.100.0
  install-prebuilts.sh mimocode --version 0.1.16
  install-prebuilts.sh jdk
  install-prebuilts.sh libreoffice
EOF
}

have() { command -v "$1" >/dev/null 2>&1; }

# Conventions: root required; existing install dirs are replaced without
# asking. Both are checked/enforced here so every install path shares them.
require_root() {
    if [ "$(id -u)" -ne 0 ]; then
        echo "[install-prebuilts] ERROR: must run as root (e.g. sudo $0 ...)" >&2
        exit 1
    fi
}

# Free-space preflight, enforced before any download starts. Tarballs plus
# extracted trees peak around 10G for a full run; refuse up front instead of
# filling the disk mid-install. Checked on the /opt filesystem (installs land
# there; the /tmp scratch tarballs usually share the same fs).
require_free_space() {
    local need_kb=$((8 * 1024 * 1024))
    local avail_kb
    avail_kb=$(df -Pk /opt 2>/dev/null | awk 'NR == 2 { print $4 }' || true)
    case "${avail_kb}" in
        ''|*[!0-9]*) die "cannot determine free disk space for /opt" ;;
    esac
    if [ "${avail_kb}" -lt "${need_kb}" ]; then
        die "not enough free disk space on /opt: $((avail_kb / 1024)) MiB free, need about $((need_kb / 1024)) MiB"
    fi
    log "free space ok: $((avail_kb / 1024)) MiB free on /opt (need about 10G)"
}

# Remove an existing install dir before a fresh install. Convention over
# configuration: no prompt, no backup — a leftover dir is either stale or a
# half-finished install, and liveiso disks cannot hold two copies anyway.
replace_dir() {
    local dir="$1"
    if path_exists "${dir}"; then
        log "removing existing ${dir}"
        safe_rm_rf "${dir}"
    else
        log "no existing ${dir}, fresh install"
    fi
}

# True if the path exists as dir, file or symlink (even a dangling one).
path_exists() {
    [ -e "$1" ] || [ -L "$1" ]
}

# Strict rm -rf guard. The script runs as root, so a buggy path must never
# take out the system. Refuses: empty path, "/", "/opt" itself, relative
# paths, paths with "..", trailing slashes (rm -rf "$dir/" with dir="",
# i.e. "/", is the classic footgun). Only deletes what is already on disk
# under one of the approved roots.
safe_rm_rf() {
    local target="$1"

    [ -n "${target}" ] || die "safe_rm_rf: refusing empty path"
    case "${target}" in
        /)                die "safe_rm_rf: refusing to remove /" ;;
        /bin|/boot|/dev|/etc|/home|/lib|/lib64|/opt|/proc|/root|/run|/sbin|/srv|/sys|/tmp|/usr|/var)
                          die "safe_rm_rf: refusing to remove system root dir ${target}" ;;
        */)               die "safe_rm_rf: refusing trailing slash (would expand to /): ${target}" ;;
        */../*|*/..|../*|..)
                          die "safe_rm_rf: refusing path with ..: ${target}" ;;
        /*)               ;; # absolute and survived the checks above
        *)                die "safe_rm_rf: refusing relative path: ${target}" ;;
    esac

    # Allowlist: /opt/<tool> install roots and this run's scratch root only.
    # SCRATCH_ROOT is matched only when it has been initialized, so an empty
    # variable can never turn "${SCRATCH_ROOT}"/* into a bare /* pattern.
    case "${target}" in
        "${GO_ROOT}"|"${RUST_ROOT}"|"${FIREFOX_ROOT}"|"${MIMOCODE_ROOT}"|"${VULKAN_ROOT}"|"${JDK_ROOT}"|"${LIBREOFFICE_ROOT_PREFIX}"*)
            ;;
        *)
            [ -n "${SCRATCH_ROOT}" ] || die "safe_rm_rf: refusing path outside allowlist: ${target}"
            case "${target}" in
                "${SCRATCH_ROOT}"|"${SCRATCH_ROOT}"/*) ;;
                *) die "safe_rm_rf: refusing path outside allowlist: ${target}" ;;
            esac
            ;;
    esac

    # Delete only what is actually there - a missing target is a quiet no-op,
    # never an invitation to reinterpret the path.
    path_exists "${target}" || return 0

    rm -rf -- "${target}"
}

# Fetch to a temp file first, then rename into place, so a failed download
# never leaves a truncated artifact behind. Retries absorb transient network
# errors (live environments often have flaky links). All removals go through
# safe_rm_rf even for a scratch file - root discipline is uniform.
fetch() {
    local url="$1" dest="$2"
    local part="${dest}.part"

    safe_rm_rf "${part}"
    if have curl; then
        curl -fL --retry 3 --retry-delay 2 --connect-timeout 30 \
             --progress-bar "$url" -o "${part}" \
             || { safe_rm_rf "${part}"; die "download failed: ${url}"; }
    elif have wget; then
        wget --tries=3 --timeout=30 -O "${part}" "$url" \
             || { safe_rm_rf "${part}"; die "download failed: ${url}"; }
    else
        die "neither curl nor wget is available"
    fi
    [ -s "${part}" ] || { safe_rm_rf "${part}"; die "download empty: ${url}"; }
    mv -f "${part}" "${dest}"
}

# One scratch root per run, removed on any exit path (including die/ERR).
# Sub-dirs are plain paths below it - never registered from a subshell.
SCRATCH_ROOT=""
cleanup_scratch() {
    [ -n "${SCRATCH_ROOT}" ] && safe_rm_rf "${SCRATCH_ROOT}"
}
trap cleanup_scratch EXIT

# Scratch dir for a named step. Created on demand under SCRATCH_ROOT.
scratch_dir() {
    [ -n "${SCRATCH_ROOT}" ] || die "internal: SCRATCH_ROOT not initialized"
    mkdir -p "${SCRATCH_ROOT}/$1"
    printf '%s\n' "${SCRATCH_ROOT}/$1"
}

# Detect if running in a VM
detect_vm() {
    local virt dmi
    if command -v systemd-detect-virt >/dev/null 2>&1; then
        virt=$(systemd-detect-virt --vm 2>/dev/null || true)
        case "$virt" in
            qemu|kvm|vmware|virtualbox|oracle*|microsoft|xen|bochs|parallels)
                return 0
                ;;
        esac
    fi
    # DMI: QEMU product_name is usually "Standard PC (...)" and "QEMU" itself
    # sits in sys_vendor - check all three fields, not just product_name.
    dmi=$(cat /sys/class/dmi/id/product_name /sys/class/dmi/id/sys_vendor \
              /sys/class/dmi/id/board_vendor 2>/dev/null | tr -d '\0' || true)
    case "$dmi" in
        *QEMU*|*KVM*|*"Standard PC"*|*VirtualBox*|*VMware*|*"Virtual Machine"*|*Hyper-V*|*"Microsoft Corporation"*|*Xen*|*Bochs*|*Parallels*)
            return 0
            ;;
    esac
    # CPUID hypervisor flag
    if [ -r /proc/cpuinfo ] && grep -q '^flags.* hypervisor' /proc/cpuinfo 2>/dev/null; then
        return 0
    fi
    return 1
}

# Go's release tarball unpacks to a "go/" directory. Extract into /opt so the
# toolchain lands at /opt/go with GOROOT=/opt/go and binaries in /opt/go/bin.
install_go() {
    local version="$1"
    local tmp tarball url

    # Accept both "1.27.2" and "go1.27.2".
    version="${version#go}"
    [ -n "${version}" ] || die "Go version must not be empty"

    replace_dir "${GO_ROOT}"

    tarball="go${version}.linux-amd64.tar.gz"
    url="https://go.dev/dl/${tarball}"
    tmp="$(scratch_dir go)"

    log "Downloading Go ${version} from ${url}"
    fetch "$url" "${tmp}/${tarball}"

    log "Installing Go to ${GO_ROOT}"
    tar -C /opt -xzf "${tmp}/${tarball}"

    [ -x "${GO_ROOT}/bin/go" ] || die "Go install failed: ${GO_ROOT}/bin/go not found"
    log "Go installed: $(${GO_ROOT}/bin/go version)"
}

# Rust's combined standalone tarball unpacks to component directories
# (rustc/, cargo/, rust-std-*/, ...). Extract into /opt/rust so binaries land
# at /opt/rust/rustc/bin and /opt/rust/cargo/bin — the layout the PATH hint
# assumes. rustup cannot produce this split.
install_rust() {
    local version="$1"
    local tmp tarball url

    # Accept "1.99.1" or "rust-1.99.1".
    version="${version#rust-}"
    [ -n "${version}" ] || die "Rust version must not be empty"

    replace_dir "${RUST_ROOT}"

    tarball="rust-${version}-x86_64-unknown-linux-gnu.tar.xz"
    url="https://static.rust-lang.org/dist/${tarball}"
    tmp="$(scratch_dir rust)"

    log "Downloading Rust ${version} from ${url}"
    fetch "$url" "${tmp}/${tarball}"

    log "Installing Rust to ${RUST_ROOT}"
    mkdir -p "${RUST_ROOT}"
    # --strip-components=1 drops the rust-<ver>-<triple>/ wrapper so we get
    # /opt/rust/{rustc,cargo,rust-std-*}/ directly.
    tar -C "${RUST_ROOT}" --strip-components=1 -xJf "${tmp}/${tarball}"

    # rust-std and rustc are separate component trees; rustc only looks in its
    # own sysroot at lib/rustlib/<triple>/lib. Without merging them, rustc
    # fails with E0463 (can't find crate for `std`).
    local std_lib sysroot_triple
    for std_lib in "${RUST_ROOT}"/rust-std-*/lib/rustlib/x86_64-unknown-linux-gnu/lib; do
        [ -d "${std_lib}" ] || continue
        sysroot_triple="${RUST_ROOT}/rustc/lib/rustlib/x86_64-unknown-linux-gnu"
        mkdir -p "${sysroot_triple}"
        [ -d "${sysroot_triple}/lib" ] || cp -a "${std_lib}" "${sysroot_triple}/lib"
    done

    [ -x "${RUST_ROOT}/rustc/bin/rustc" ] || die "Rust install failed: ${RUST_ROOT}/rustc/bin/rustc not found"
    [ -x "${RUST_ROOT}/cargo/bin/cargo" ] || die "Rust install failed: ${RUST_ROOT}/cargo/bin/cargo not found"
    log "Rust installed: $(${RUST_ROOT}/rustc/bin/rustc --version)"
    log "Cargo installed: $(${RUST_ROOT}/cargo/bin/cargo --version)"
}

download_setup_firefox() {
    local version="$1"
    local tmp tarball url

    # Accept both "158.0.1" and "firefox-158.0.1".
    version="${version#firefox-}"
    [ -n "${version}" ] || die "Firefox version must not be empty"

    replace_dir "${FIREFOX_ROOT}"

    tarball="firefox-${version}.tar.xz"
    url="https://download-installer.cdn.mozilla.net/pub/firefox/releases/${version}/linux-x86_64/en-US/${tarball}"
    tmp="$(scratch_dir firefox)"

    log "Downloading Firefox ${version} from ${url}"
    fetch "$url" "${tmp}/${tarball}"

    log "Installing Firefox to ${FIREFOX_ROOT}"
    tar -C /opt -xJf "${tmp}/${tarball}"

    [ -x "${FIREFOX_ROOT}/firefox" ] || die "Firefox install failed: ${FIREFOX_ROOT}/firefox not found"
    log "Firefox installed: $(${FIREFOX_ROOT}/firefox --version)"

    setup_firefox_config
}

# Runtime config for /opt/firefox — mirrors rootfs setup_firefox() config half.
setup_firefox_config() {
    # Dynamic linker search path
    mkdir -p /etc/ld.so.conf.d
    echo "/opt/firefox" > /etc/ld.so.conf.d/firefox.conf
    ldconfig 2>/dev/null || true

    # Widevine CDM (preinstalled at /usr/lib/cdm/widevine by rootfs setup_prebuilts)
    local wv_dir=/usr/lib/cdm/widevine
    if [ -f "${wv_dir}/libwidevinecdm.so" ] && [ -f "${wv_dir}/manifest.json" ]; then
        mkdir -p "${FIREFOX_ROOT}/gmp-widevinecdm/1.0"
        cp "${wv_dir}/manifest.json" "${FIREFOX_ROOT}/gmp-widevinecdm/1.0/"
        cp "${wv_dir}/libwidevinecdm.so" "${FIREFOX_ROOT}/gmp-widevinecdm/1.0/"
        log "Widevine CDM installed to ${FIREFOX_ROOT}/gmp-widevinecdm/1.0"
    else
        log "WARNING: ${wv_dir} not found, skipping Widevine CDM"
    fi

    # Force English UI
    mkdir -p "${FIREFOX_ROOT}/distribution"
    cat > "${FIREFOX_ROOT}/distribution/policies.json" << 'FFEOF'
{
  "policies": {
    "RequestedLocales": ["en-US"],
    "DisableTelemetry": true,
    "DisableFirefoxStudies": true,
    "DisablePocket": true
  }
}
FFEOF

    # Default prefs: base entries (telemetry off / Widevine on) are always
    # written; VM-only entries (WebGL / GPU accel / hw-decode off) only in a
    # VM - without them A/V playback breaks in VMs, and on bare metal they
    # would just throw away acceleration.
    mkdir -p "${FIREFOX_ROOT}/defaults/pref"
    {
        cat << 'FFEOF'
// Kan-Linux Firefox defaults
pref("browser.startup.homepage_override.mstone", "ignore");
pref("browser.shell.checkDefaultBrowser", false);
pref("datareporting.policy.dataSubmissionEnabled", false);
pref("toolkit.telemetry.reportingpolicy.firstRun", false);
pref("media.eme.enabled", true);
pref("media.widevine.enabled", true);
pref("media.gmp-widevinecdm.enabled", true);
pref("media.gmp-widevinecdm.visible", true);
pref("media.gmp-widevinecdm.autoupdate", true);
pref("media.gmp-widevinecdm.version", "1.0");
FFEOF
        if detect_vm; then
            log "VM detected: adding VM-specific Firefox prefs (WebGL/GPU/hw-decode off)"
            cat << 'FFEOF'
// VM-specific (QEMU etc.): A/V playback breaks without these
pref("webgl.disabled", true);
pref("layers.acceleration.disabled", true);
pref("media.hardware-video-decoding.enabled", false);
pref("gfx.webrender.all", false);
FFEOF
        else
            log "bare metal: skipping VM-specific Firefox prefs (acceleration kept on)"
        fi
    } > "${FIREFOX_ROOT}/defaults/pref/kanlinux-prefs.js"

    log "Firefox config done (policies.json + kanlinux-prefs.js)"
}

# MiMoCode: official GitHub release tarball unpacks to a single "mimo"
# binary. Install to /opt/mimocode/bin/mimo and symlink /usr/local/bin/mimo
install_mimocode() {
    local version="$1"
    local tmp tarball url target

    # Accept "0.1.16", "v0.1.16" or "mimocode-0.1.16".
    version="${version#v}"
    version="${version#mimocode-}"
    [ -n "${version}" ] || die "MiMoCode version must not be empty"

    replace_dir "${MIMOCODE_ROOT}"

    target="linux-x64"
    if ! grep -qwi avx2 /proc/cpuinfo 2>/dev/null; then
        log "no AVX2 in /proc/cpuinfo: using baseline build"
        target="linux-x64-baseline"
    fi

    tarball="mimocode-${target}.tar.gz"
    url="https://github.com/XiaomiMiMo/MiMo-Code/releases/download/v${version}/${tarball}"
    tmp="$(scratch_dir mimocode)"

    log "Downloading MiMoCode ${version} from ${url}"
    fetch "$url" "${tmp}/${tarball}"

    log "Installing MiMoCode to ${MIMOCODE_ROOT}"
    mkdir -p "${MIMOCODE_ROOT}/bin"
    # Tarball contains a single "mimo" binary at its root.
    tar -C "${MIMOCODE_ROOT}/bin" -xzf "${tmp}/${tarball}"
    chmod 755 "${MIMOCODE_ROOT}/bin/mimo"

    mkdir -p /usr/local/bin
    ln -sfn "${MIMOCODE_ROOT}/bin/mimo" /usr/local/bin/mimo

    [ -x "${MIMOCODE_ROOT}/bin/mimo" ] || die "MiMoCode install failed: ${MIMOCODE_ROOT}/bin/mimo not found"
    log "MiMoCode installed: $(${MIMOCODE_ROOT}/bin/mimo --version)"
    log "launcher symlinked: /usr/local/bin/mimo"
}

install_vulkan() {
    local version="$1"
    local tmp tarball url arch_dir

    # Accept "1.4.304.1" or "vulkan-1.4.304.1" or "vulkansdk-1.4.304.1".
    version="${version#vulkan-}"
    version="${version#vulkansdk-}"
    version="${version#v}"
    [ -n "${version}" ] || die "Vulkan SDK version must not be empty"

    replace_dir "${VULKAN_ROOT}"

    tarball="vulkansdk-linux-x86_64-${version}.tar.xz"
    url="https://sdk.lunarg.com/sdk/download/${version}/linux/${tarball}"
    tmp="$(scratch_dir vulkan)"

    log "Downloading Vulkan SDK ${version} from ${url}"
    fetch "$url" "${tmp}/${tarball}"

    log "Installing Vulkan SDK to ${VULKAN_ROOT}"
    # Tarball layout: <version>/x86_64/{bin,include,lib,share}
    mkdir -p "${VULKAN_ROOT}"
    tar -C "${tmp}" -xJf "${tmp}/${tarball}"
    arch_dir="${tmp}/${version}/x86_64"
    # Fallback: some builds use a "x86_64" dir; also accept the single child dir.
    if [ ! -d "${arch_dir}" ]; then
        arch_dir="$(find "${tmp}" -mindepth 2 -maxdepth 2 -type d \( -name x86_64 -o -name amd64 \) | head -1)"
    fi
    [ -d "${arch_dir}" ] || die "Vulkan SDK layout unexpected: no x86_64 dir under ${tmp}/${version}"

    # Move the arch tree contents into /opt/vulkan (strip the <ver>/<arch> wrapper).
    cp -a "${arch_dir}/." "${VULKAN_ROOT}/"
    rm -rf "${tmp}/${version}" "${tmp}/${tarball}"

    [ -x "${VULKAN_ROOT}/bin/vulkaninfo" ] \
        || die "Vulkan SDK install failed: ${VULKAN_ROOT}/bin/vulkaninfo not found"
    log "Vulkan SDK installed: ${VULKAN_ROOT}"
    log "vulkaninfo: ${VULKAN_ROOT}/bin/vulkaninfo"
}

install_jdk() {
    local version="$1"
    local tmp tarball url

    # Accept "27.0.1.0.3" or "jdk-27.0.1.0.3".
    version="${version#jdk-}"
    [ -n "${version}" ] || die "JDK version must not be empty"

    replace_dir "${JDK_ROOT}"

    tmp="$(scratch_dir jdk)"
    if [ "${version}" = "latest" ]; then
        tarball="jdk-27_linux-x64_bin.tar.gz"
        url="https://download.oracle.com/java/27/latest/${tarball}"
    else
        tarball="jdk-${version}_linux-x64_bin.tar.gz"
        url="https://download.oracle.com/java/27/archive/${tarball}"
    fi

    log "Downloading JDK ${version} from ${url}"
    fetch "$url" "${tmp}/${tarball}"

    log "Installing JDK to ${JDK_ROOT}"
    # --strip-components=1 drops the jdk-<ver>/ wrapper so the tree lands
    # directly at /opt/jdk (matches rootfs setup_jdk() layout).
    mkdir -p "${JDK_ROOT}"
    tar -C "${JDK_ROOT}" --strip-components=1 -xzf "${tmp}/${tarball}"

    [ -x "${JDK_ROOT}/bin/java" ] || die "JDK install failed: ${JDK_ROOT}/bin/java not found"

    # PATH entry (/usr/local/bin is ahead of /usr/bin) + JAVA_HOME —
    # mirror of rootfs setup_jdk().
    mkdir -p /usr/local/bin
    local _tool _name
    for _tool in "${JDK_ROOT}"/bin/*; do
        [ -f "${_tool}" ] || continue
        _name=$(basename "${_tool}")
        ln -sfn "${JDK_ROOT}/bin/${_name}" "/usr/local/bin/${_name}"
    done

    mkdir -p /etc/profile.d
    cat > /etc/profile.d/jdk.sh << 'EOF'
export JAVA_HOME="${JAVA_HOME:-/opt/jdk}"
EOF

    log "JDK installed: $(${JDK_ROOT}/bin/java -version 2>&1 | head -1)"
    log "JAVA_HOME set in /etc/profile.d/jdk.sh; open a new shell to pick it up"
}

install_libreoffice() {
    local version="$1"
    local tmp tarball url lo_dir old

    # Accept "26.8.3.1" or "libreoffice-26.8.3.1".
    version="${version#libreoffice-}"
    [ -n "${version}" ] || die "LibreOffice version must not be empty"

    tmp="$(scratch_dir libreoffice)"
    if [ "${version}" = "latest" ]; then
        tarball="LibreOffice-latest.standard-x86_64.AppImage"
    else
        tarball="LibreOffice-${version}.standard-x86_64.AppImage"
    fi
    url="https://appimages.libreitalia.org/${tarball}"

    log "Downloading LibreOffice ${version} from ${url}"
    fetch "$url" "${tmp}/${tarball}"

    log "Extracting AppImage"
    chmod +x "${tmp}/${tarball}"
    ( cd "${tmp}" && "./${tarball}" --appimage-extract >/dev/null )

    lo_dir="$(echo "${tmp}"/squashfs-root/opt/libreoffice*)"
    [ -d "${lo_dir}" ] || die "LibreOffice tree not found under ${tmp}/squashfs-root/opt"

    # Replace-on-run like every other target; versioned names may differ
    # across updates (/opt/libreoffice26.8 -> /opt/libreoffice27.x), so clear
    # any previous install first.
    for old in "${LIBREOFFICE_ROOT_PREFIX}"*; do
        path_exists "${old}" && safe_rm_rf "${old}"
    done

    log "Installing LibreOffice to /opt"
    cp -a "${lo_dir}" /opt/
    cp -a "${tmp}"/squashfs-root/usr/. /usr/

    # Draw/Impress fail to start in this build — drop their menu entries.
    rm -f /usr/share/applications/libreoffice*-draw.desktop \
          /usr/share/applications/libreoffice*-base.desktop \
          /usr/share/applications/libreoffice*-startcenter.desktop \
          /usr/share/applications/libreoffice*-impress.desktop

    have update-desktop-database && update-desktop-database /usr/share/applications 2>/dev/null || true
    have update-mime-database && update-mime-database /usr/share/mime 2>/dev/null || true

    log "LibreOffice installed: ${lo_dir##*/squashfs-root}"
    log "launch from the app menu (desktop entries installed) or run ${lo_dir##*/squashfs-root/opt/}"
}

main() {
    local target=""
    local go_version="$GO_DEFAULT_VERSION"
    local rust_version="$RUST_DEFAULT_VERSION"
    local firefox_version="$FIREFOX_DEFAULT_VERSION"
    local mimocode_version="$MIMOCODE_DEFAULT_VERSION"
    local vulkan_version="$VULKAN_DEFAULT_VERSION"
    local jdk_version="$JDK_DEFAULT_VERSION"
    local libreoffice_version="$LIBREOFFICE_DEFAULT_VERSION"
    local last_target=""

    require_root

    SCRATCH_ROOT="$(mktemp -d /tmp/install-prebuilts.XXXXXX)"

    while [ $# -gt 0 ]; do
        case "$1" in
            go|rust|firefox|mimocode|vulkan|jdk|libreoffice|install|update)
                target="$1"
                last_target="$1"
                ;;
            --version)
                shift
                [ $# -gt 0 ] || die "--version requires an argument"
                case "${last_target}" in
                    go)          go_version="${1#go}" ;;
                    rust)        rust_version="${1#rust-}" ;;
                    firefox)     firefox_version="${1#firefox-}" ;;
                    mimocode)    mimocode_version="${1#mimocode-}" ;;
                    vulkan)      vulkan_version="${1#vulkan-}"; vulkan_version="${vulkan_version#v}" ;;
                    jdk)         jdk_version="${1#jdk-}" ;;
                    libreoffice) libreoffice_version="${1#libreoffice-}" ;;
                    *)           die "--version must follow a specific target (go|rust|firefox|mimocode|vulkan|jdk|libreoffice); install/update take no --version" ;;
                esac
                ;;
            -h|--help)
                usage
                exit 0
                ;;
            *)
                die "unknown argument: $1 (try --help)"
                ;;
        esac
        shift
    done

    [ -n "$target" ] || target="default"

    # Preflight before any download/install begins.
    require_free_space

    case "$target" in
        go)       install_go "$go_version" ;;
        rust)     install_rust "$rust_version" ;;
        firefox)  download_setup_firefox "$firefox_version" ;;
        mimocode) install_mimocode "$mimocode_version" ;;
        vulkan)   install_vulkan "$vulkan_version" ;;
        jdk)      install_jdk "$jdk_version" ;;
        libreoffice) install_libreoffice "$libreoffice_version" ;;
        default)
            install_go "$go_version"
            install_jdk "$jdk_version"
            install_rust "$rust_version"
            ;;
        install)
            install_go "$go_version"
            install_jdk "$jdk_version"
            install_vulkan "$vulkan_version"
            install_rust "$rust_version"
            ;;
        update)
            download_setup_firefox "$firefox_version"
            install_mimocode "$mimocode_version"
            install_libreoffice "$libreoffice_version"
            ;;
    esac

    cat <<'EOF'

Done. Toolchains are already on PATH (rootfs default).

EOF
}

main "$@"
