# Kan-Linux

*See through the delusions, return to simplicity*

**勘破遮蔽，回归本真**

English | [中文](README-zh.md)

---

## About

**Kan-Linux** is a Pure, **Source‑Built**, **Truly Agent‑First** Linux distribution\, planned for release 2026-10-1. The name **Kan** derives from *Instructions for Practical Living* by [Wang Yangming](https://en.wikipedia.org/wiki/Wang_Yangming), representing the philosophy of breaking through technical obscurations and returning to the system’s original simplicity\.

This project thoroughly abandons the bloated legacy desktop stack including GTK, Cairo and Pango, eliminating decades of accumulated technical debt on traditional Linux desktops\. Based on lightweight musl libc \+ busybox foundation, it adopts a modern Qt \+ Hyprland Wayland architecture, keeping the system idle\-quiet and responsive on demand\.

## Design Philosophy

- **Purity** — Remove redundant dependencies and legacy rendering layers (similar to the core principle of ggml/llama.cpp)

- **Minimalism** — Lightweight musl base with zero useless overhead

- **Modernity** — Pure Wayland\-native desktop, drop outdated X11 stack

- **Source-Built** — The entire OS and all components are built from source, enabling AI agents to intelligently build, deploy and repair the system autonomously

- **llama.cpp-First** — Built-in native llama.cpp edge inference engine for local AI deployment

- **Agent\-First \& Agent\-Friendly** — designed for AI agent autonomous operation, auto\-compilation, component deployment and intelligent troubleshooting

- **True Agent-First** — Most so-called "agentic-first" Linux distributions are essentially conventional systems (Ubuntu, Nix, Arch) with AI tools preinstalled.
They retain traditional package managers (`deb`/`rpm`/`nix`/`pacman`), binary repositories and legacy system state logic.
On these systems, **the agent is optional** — it is merely an assistant application, not a system necessity.

--- 

## Kan-Linux redefines the Agent-First paradigm fundamentally


1. **No traditional package management**

All userland components and applications are built strictly from source.No package database, no binary repository dependencies, no distro-specific packaging abstractions.Software lifecycle is reduced to primitive, automatable workflows:`source fetch → patch → audit → build → deploy`.

2. **Agent is mandatory, not optional**

Kan-Linux only provides a minimal, auditable base system:`Linux kernel + musl/glibc + BusyBox init + minimal Wayland desktop stack`. All upper-layer software extension, dependency resolution, ABI verification and deployment orchestration **depends on the agent**. The system is intentionally not designed for pure manual daily extension.

3. **AI-native security audit pipeline**

Different from distro-reliant security models (maintainer-maintained CVE patches & binary auditing), Kan-Linux embeds LLM-based source-level security audit(GLM-5.3 and others) as a mandatory gate before compilation. Security is shifted from "binary post-scanning" to **source pre-admission auditing**.

4. **Deterministic, fully traceable system state**

Every binary in the system can be traced back to exact source commit, patch set and build flags. No implicit upstream drift, no hidden distro patches, no opaque package-manager state.

---

## Roadmap

Kan Linux is progressively ported and verified across multiple hardware and virtual platforms:

- QEMU virtual machine
- x86-64 desktop devices
- x86-64 laptop devices
- aarch64 laptop devices(Snapdraon on Linux)

---

## Acknowledgements
- Inspired by [Omarchy Linux](https://github.com/omacom/omarchy)
- Thanks to [LFS (Linux From Scratch)](https://www.linuxfromscratch.org/)
- Thanks to [Pop!\_OS ISO](https://github.com/pop-os/iso)
- Thanks to [try-omarchy-linux](https://github.com/zhouwg/try-omarchy-linux)
- Thanks to the entire Linux community(various tech stacks)
- Thanks to [llama.cpp](https://github.com/ggml-org/llama.cpp)

---

## License
This project is licensed under the MIT License.

You are welcome to fork this repository and submit pull requests.
If you reuse the code or materials from this project, **please retain attribution to this source**.

