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

<div align="center">
<b>a Simplicity, Source-built, Agent-First Linux distro</b>
</div>

<br>

## Description

**Kan-Linux**(or KanLinux) is a **Simplicity**, **Source‑Built**, **Agent‑First** Linux distribution\. The name **Kan(勘)** derives from *Instructions for Practical Living* by [Wang Yangming](https://en.wikipedia.org/wiki/Wang_Yangming), representing the philosophy of breaking through technical obscurations and returning to the system’s original simplicity\. The name **Kan(勘)** also stands for "*see through the delusions and return to simplicity*".

The main goal of Kan-Linux is to enable programmers and AI researchers to build their own Linux OS (Omarchy-style, for example) from the full source code with minimal setup on a wide range of hardware - locally and in the cloud.

#### Design Principles
- Simplicity — Eliminate overly complex wrapper layers and overengineering, following the core philosophy of [ggml/llama.cpp](https://github.com/ggml-org/llama.cpp). Not dependent on any existing Linux distribution.
- Monorepo — Drawing lessons from existing Linux distributions and the **highly sophisticated [Yocto](https://www.yoctoproject.org/)** Project, the project uses an AOSP-style single-repository architecture. All source code is stored and hosted in one single code repository to simplify development, build and maintenance work.
- Source-Built — The entire OS and all components are built from source.
- llama.cpp-First — Built-in native llama.cpp edge inference engine for local AI deployment.
- Agent-First & AI-native security audit pipeline — Supports AI agents to autonomously compile, deploy, install components, run system checks and resolve issues. Kan-Linux embeds LLM-based source-level security audit (GLM-5.3 and others) as a mandatory gate before compilation. Security is shifted from "binary post-scanning" to source pre-admission auditing.


#### Differences and Connections with Omarchy
- Omarchy targets end users, delivering an out-of-the-box complete desktop system, with **visual polish as one of its core goals**.
- **Kan‑Linux targets programmers, AI researchers and Linux distribution builders**, providing a neutral Wayland underlying graphics platform. Its core goals are **controllability**, **auditability**(no black-box within the OS), **modularity and reproducible builds**, and **visual polish is not a project objective**.
- Kan‑Linux draws inspiration from [Omarchy’s desktop shell](https://github.com/kan-linux/omarchy), and integrates it as our optional early default desktop. We port this shell as an upper-layer UI example to show the capabilities of the Kan-Linux platform. Even if we remove or disable the Omarchy shell in the future, the whole system and graphics infrastructure can still run fully and independently.
- Omarchy is based on the upstream Arch Linux distribution, while Kan-Linux is built completely from scratch and **does not rely on any upstream Linux distribution**.


## Roadmap
- [x] Stage 1: Complete [PoC validation](https://github.com/kan-linux/kan/releases/tag/v0.2.6) of Kan-Linux via QEMU virtual machine
- [x] Stage 2.1: Integrate a preliminary, feature-limited, [customized Omarchy desktop shell](https://github.com/kan-linux/omarchy/tree/kan) and login greeter for QEMU virtual machine environments
- [ ] Stage 2.2: Enable and validate Kan-Linux boot and runtime support for physical x86_64 desktop PCs
- [ ] Stage 2.3: Enable and validate Kan-Linux boot and runtime support for physical x86_64 laptops
- [ ] Milestone: Kan-Linux LiveISO supports bare-metal installation. Kan-Linux achieves full self-hosting.
      All subsequent development, building and iteration of Kan-Linux will happen **inside Kan-Linux itself**.
- [ ] Stage 2.4: Integrate desktop-native AI Agent in Kan-Linux on physical x86_64 hardware
- [ ] Stage 2.5: Enable, test and fully verify desktop-native AI Agent functionality on physical x86_64 desktop and laptop hardware
- [ ] Stage 2.6: Refine and stabilize the Omarchy desktop shell for physical x86_64 desktops and laptops
- [ ] Stage 3: Port and validate Kan-Linux for AArch64 laptop devices


## Documentation

#### Screenshots and LiveISO

Please refer to https://github.com/kan-linux/kan/releases/tag/v0.2.7

#### Development

- [How to build](/docs/build.md)


## Contributing

- Contributors can open PRs
- Collaborators will be invited based on contributions
- Maintainers can push to branches in the `kan` repo and merge PRs into the `master` branch
- Any help with managing issues, PRs and projects is very appreciated!
- Read the [CONTRIBUTING.md](CONTRIBUTING.md) for more information


## Acknowledgements
- Inspired by Omarchy and [Omarchy's desktop shell](https://github.com/omacom/omarchy)
- Thanks to [LFS (Linux From Scratch)](https://www.linuxfromscratch.org/)
- Thanks to [llama.cpp](https://github.com/ggml-org/llama.cpp)
- Thanks to the entire Linux community(various tech orgs, such as Redhat(RHEL/Fedora/QEMU), SPI(Debian), Linux Foundation, Linaro, Canonical(Ubuntu), System76(Pop!_OS)... and tech stacks)
- Special thanks to the AI assistant for extensive technical discussions, architectural advice, and writing assistance throughout the development of Kan-Linux

## Trademarks

This project may include trademarks or logos belonging to third parties. Use of any third-party trademarks is governed by their respective policies.
