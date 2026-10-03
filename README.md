<p align="center">
  <picture>
    <source
      media="(prefers-color-scheme: dark)"
      srcset="assets/kanlinux-banner.png"
    />
    <source
      media="(prefers-color-scheme: light)"
      srcset="assets/kanlinux-banner.png"
    />
    <img
      src="assets/kanlinux-banner.png"
      alt="Kan-Linux — a **Simplicity**, **Source‑Built**, **Agent‑First** Linux distro."
      width="1086"
    />
  </picture>
</p>

<!--<h1 align="center">Kan-Linux</h1>-->

<p align="center">
  <strong>English</strong> |
  <a href="docs/README.zh-CN.md">简体中文</a> |
   <a href="docs/README.fr.md">Français</a> 
</p>


**Kan-Linux**(or KanLinux) is a **Simplicity**, **Source‑Built**, **Agent‑First** Linux distribution\. The name **Kan(勘)** derives from *Instructions for Practical Living* by [Wang Yangming](https://en.wikipedia.org/wiki/Wang_Yangming), representing the philosophy of breaking through technical obscurations and returning to the system’s original simplicity\. The name **Kan(勘)** also stands for "*see through the delusions and return to simplicity*".

## Design Principles
- Simplicity — Eliminate overly complex wrapper layers and overengineering, following the core philosophy of [ggml/llama.cpp](https://github.com/ggml-org/llama.cpp). Not dependent on any existing Linux distribution.
- Monorepo — Drawing lessons from existing Linux distributions and the **highly sophisticated [Yocto](https://www.yoctoproject.org/)** Project, the project uses an AOSP-style single-repository architecture. All source code is stored and hosted in one single code repository to simplify development, build and maintenance work.
- Source-Built — The entire OS and all components are built from source.
- llama.cpp-First — Built-in native llama.cpp edge inference engine for local AI deployment.
- Agent-First & AI-native security audit pipeline — Supports AI agents to autonomously compile, deploy, install components, run system checks and resolve issues. Kan-Linux embeds LLM-based source-level security audit (GLM-5.3 and others) as a mandatory gate before compilation. Security is shifted from "binary post-scanning" to source pre-admission auditing.


## Differences from Omarchy
- Omarchy targets end users, delivering an out-of-the-box complete desktop system, with **visual polish as one of its core goals**.
- **Kan‑Linux targets Linux professional programmers and Linux distribution builders**, providing a neutral Wayland underlying graphics platform. Its core goals are **controllability**, **auditability**(no black-box within the OS), **modularity and reproducible builds**, and **visual polish is not a project objective**.
- Kan‑Linux draws inspiration from Omarchy’s Quickshell, using it only as an **optional upper-layer desktop example** to demonstrate that the base platform can host modern, visually striking Wayland interfaces. Quickshell and its dependency Qt are not part of the base platform itself. If Qt + Quickshell are disabled or removed, the entire system and graphics infrastructure remains fully functional and independent.
- Omarchy is based on the upstream Arch Linux distribution, while Kan-Linux is built completely from scratch and **does not rely on any upstream Linux distribution**.

## Roadmap

- PoC via QEMU virtual machine (stage-1, done)
- Add greeter and full desktop environment in QEMU virtual machine (stage-2.1)
- Enable Kan-Linux to run on physical x86-64 desktop PCs (stage-2.2)
- Enable Kan-Linux to run on physical x86-64 laptops (stage-2.3)
- Add AI-Agent within the desktop environment in QEMU virtual machine (stage-2.4)
- Enable/test/verify AI-Agent within the desktop environment in physical x86-64 PCs/laptops (stage-2.5)
- AArch64 laptops (stage-3)


## How to fetch codes

```bash

git clone --recurse-submodules https://github.com/kan-linux/kan.git

```

You may use **the prebuilt rootfs** available at [https://github.com/kan-linux/iso](https://github.com/kan-linux/iso) for customization, then generate your own Wayland desktop distribution comparable to Omarchy.

You may also use this repository as the foundation, with the help of powerful AI tools, to retrace verified workflow and work through the solved challenges ------ "[get hands dirty and don't be lazy](https://www.linuxcompatible.org/story/kdes-dont-be-lazy-ai-draft-sparks-ban-call/)", and build an Omarchy-style Linux distro from source code.

## How to use and Screenshots
Please refer to https://github.com/kan-linux/iso. That repository hosts prebuilt rootfs and ISO images, screenshots and user guides, while this main repository contains only source code.


## Security track

https://www.debian.org/security/

https://security-tracker.debian.org/tracker/source-package/linux

## Acknowledgements
- Inspired by [Omarchy Linux](https://github.com/omacom/omarchy)
- Thanks to [LFS (Linux From Scratch)](https://www.linuxfromscratch.org/)
- Thanks to [llama.cpp](https://github.com/ggml-org/llama.cpp)
- Thanks to the entire Linux community(various tech orgs, such as Redhat(RHEL/Fedora/QEMU), SPI(Debian), Linux Foundation, Linaro, Canonical(Ubuntu), System76(Pop!_OS)... and tech stacks)
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

