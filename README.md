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

- **Minimalism** — Lightweight underlying architecture with no extraneous system overhead

- **Modernity** — Pure Wayland\-native desktop, drop outdated X11/GTK stack

- **Source-Built** — The entire OS and all components are built from source, enabling AI agents to intelligently build, deploy and repair the system autonomously

- **llama.cpp-First** — Built-in native llama.cpp edge inference engine for local AI deployment

- **Agent\-First \& Agent\-Friendly** — Designed for intelligent agents. Supports AI agents to autonomously compile, deploy, install components, run system checks and resolve issues

- **True Agent-First** — Most "agent-first" systems on the market simply pre-install AI tools on top of traditional distributions such as Ubuntu, Nix or Arch Linux. Those systems still rely on conventional package managers (deb/rpm/nix/pacman), binary software repositories and legacy system state logic. In such systems, AI agents are merely optional add-on applications rather than core parts of system operation. Kan-Linux provides only a minimal, source-built and auditable base system. Tasks including optional upper-layer extensions, dependency resolution, ABI consistency validation and deployment orchestration are handled by AI agents.

- **AI-native security audit pipeline** — Different from distro-reliant security models (maintainer-maintained CVE patches & binary auditing), Kan-Linux embeds LLM-based source-level security audit(GLM-5.3 and others) as a mandatory gate before compilation. Security is shifted from "binary post-scanning" to **source pre-admission auditing**.

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

