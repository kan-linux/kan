# Kan-Linux

*See through the delusions, return to simplicity*


## About

**Kan-Linux**(or KanLinux) is a Pure, **Source‑Built**, **Agent‑First** Linux distribution\, The first public release was published at 23:00, Sep 30, 2026 (UTC+08:00). The name **Kan** derives from *Instructions for Practical Living* by [Wang Yangming](https://en.wikipedia.org/wiki/Wang_Yangming), representing the philosophy of breaking through technical obscurations and returning to the system’s original simplicity\.


## Design Philosophy

- **Purity** — Remove redundant dependencies and legacy rendering layers (similar to the core principle of ggml/llama.cpp)

- **Minimalism** — Lightweight underlying architecture, not dependent on any existing Linux distribution.

- **Monorepo** — Drawing lessons from existing Linux distributions, the project uses an AOSP-style single-repository architecture. All source code is stored and hosted in one single code repository to simplify development, build and maintenance work.

- **Source-Built** — The entire OS and all components are built from source.

- **llama.cpp-First** — Built-in native llama.cpp edge inference engine for local AI deployment

- **Agent\-First \& Agent\-Friendly** — Designed for intelligent agents. Supports AI agents to autonomously compile, deploy, install components, run system checks and resolve issues

- **AI-native security audit pipeline** — Different from distro-reliant security models (maintainer-maintained CVE patches & binary auditing), Kan-Linux embeds LLM-based source-level security audit(GLM-5.3 and others) as a mandatory gate before compilation. Security is shifted from "binary post-scanning" to **source pre-admission auditing**.


## Differences from Omarchy
- Omarchy targets end users, delivering an out-of-the-box complete desktop system, with **visual polish as one of its core goals**.
- Kan‑Linux targets distribution builders, providing a neutral Wayland underlying graphics platform. Its core goals are **controllability, auditability, modularity and reproducible builds**, and **visual polish is not a project objective**.
- Kan‑Linux draws inspiration from Omarchy’s Quickshell, using it only as an **optional upper-layer desktop example** to demonstrate that the base platform can host modern, visually striking Wayland interfaces. Quickshell and its dependency Qt are not part of the base platform itself. If Qt + Quickshell are disabled or removed, the entire system and graphics infrastructure remains fully functional and independent.

## Roadmap

Kan-Linux(or KanLinux) is progressively ported and verified across multiple hardware and virtual platforms:

- QEMU virtual machine
- x86-64 desktop devices
- x86-64 laptop devices
- aarch64 laptop devices(Snapdraon on Linux)

## How to fetch codes

```bash

git clone --recurse-submodules https://github.com/kan-linux/kan.git

```


## Screenshots and How to use
Please refer to https://github.com/kan-linux/iso.

That repository hosts prebuilt rootfs and ISO images, screenshots and user guides, while this main repository contains only source code.


## Tips

If this project gains over 1000 GitHub stars, I will release the full source code, the users will be able to **build a Wayland desktop distribution similar to Omarchy directly from this single repository**.

Alternatively, you may use **the prebuilt rootfs** available at [https://github.com/kan-linux/iso](https://github.com/kan-linux/iso) for customization, then generate your own Wayland desktop distribution comparable to Omarchy.

You may also use this repository as the foundation, with the help of powerful AI tools, to retrace my workflow and work through the same challenges, and build an Omarchy-style Linux desktop distribution from source code.


## Acknowledgements
- Inspired by [Omarchy Linux](https://github.com/omacom/omarchy)
- Thanks to [LFS (Linux From Scratch)](https://www.linuxfromscratch.org/)
- Thanks to [Pop!\_OS ISO](https://github.com/pop-os/iso)
- Thanks to [try-omarchy-linux](https://github.com/zhouwg/try-omarchy-linux)
- Thanks to the entire Linux community(various tech stacks)
- Thanks to [llama.cpp](https://github.com/ggml-org/llama.cpp)
- Special thanks to the AI assistant for extensive technical discussions, architectural advice, and writing assistance throughout the development of Kan-Linux

## License

This code repository is released under the [MIT License](LICENSE).

## Citation

If you use kan-linux in your work, please cite:

```bibtex
@misc{kan-linux2026,
  title     = {Kan-Linux: an Agent-First modern Linux distro built from scratch},
  author    = { Jeff Zhou and MiMo-V2.5-Pro },
  year      = {2026},
  publisher = {GitHub},
  url       = {https://github.com/kan-linux/kan}
}
```

