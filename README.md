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
  <a href="/docs/README.zh-CN.md">中文</a>
</p>

<br>

## Description

**Kan-Linux**(or KanLinux) is a **Concise**, **Security** and **Agent‑First** Linux distribution\. The name **Kan(勘)** derives from *Instructions for Practical Living* by [Wang Yangming](https://en.wikipedia.org/wiki/Wang_Yangming), representing the philosophy of breaking through technical obscurations and returning to the system’s original simplicity\. The name **Kan(勘)** also stands for "*see through the delusions and return to simplicity*".

The main goal of Kan-Linux is to build a concise, secure and Agent-first Linux distro at the edge --- locally and in the cloud.

#### Design Principles
- Simplicity --- Eliminate overly complex wrapper layers and overengineering, following the core philosophy of [ggml/llama.cpp](https://github.com/ggml-org/llama.cpp). **Kan-Linux is not dependent on any existing Linux distribution.**
  - Keep the LiveISO compact while supporting a rich set of modern desktop features.
  - The full self-hosting bootstrapping pipeline covers only the OS base system. Heavy desktop applications(chromium,[office suite](https://www.libreoffice.org/download-other/)...) are built separately on top of a fully bootstrapped Kan-Linux instance and distributed as optional artifacts (similar to the pinned official Firefox tar.gz/tar.xz releases).
  - **No GNOME or KDE desktop stacks.** While GTK and Qt are capable toolkits, Kan-Linux builds a lean, minimal desktop environment from scratch. Applications are pluggable, with no mandatory global metadata, introspection subsystems, or complex hidden runtime contracts.

- Monorepo --- Drawing lessons from many existing Linux distributions and the highly complicated [Yocto Project](https://www.yoctoproject.org/), Kan-Linux adopts an AOSP-style single-repository architecture. All source code resides in one repository to simplify development, builds, and maintenance.

- Secure --- Our goal is not an unbreakable system, but to shrink the TCB and attack surface, while maximizing SBOM clarity and supply-chain security.
  - Optimized for single-user desktop workflows to reduce attack surface.
  - Source-built --- The base OS and its components are compiled from source, with a small explicit exception list: prebuilt artifacts such as Go, Rust, Firefox, Vulkan SDK, and user-installed software. This maximizes SBOM transparency and supply-chain auditability.
  - **SELinux is excluded intentionally to keep the TCB minimal.**
  - AI-native security audit pipeline --- Kan-Linux embeds LLM-powered source-level security auditing (GLM-5.3 and other high-capability models) as a mandatory pre-compilation gate, complementing human review. Security validation shifts from post-hoc binary scanning to source-code admission review.
  - 100% full self-hosting; 100% reproducible builds.

- Agent-First
  - **No traditional package manager.** AI agents are a core component of Kan-Linux: they autonomously compile, deploy, install components, run system health checks, and resolve issues.
  - llama.cpp-First --- A native, integrated llama.cpp edge inference engine is provided for local AI deployment.
  - Maintain a balance between Agent-first automation and plain human-readable interfaces and workflows.


#### Differences and Connections with Omarchy
- Omarchy-Linux targets end users, delivering an out-of-the-box complete desktop system, with **visual polish as one of its core goals**. **Kan‑Linux targets programmers, AI researchers and Linux distribution builders**, providing a neutral Wayland underlying graphics platform. Its core goals are **controllability**, **auditability**(no black-box within the OS), **modularity and reproducible builds**, and **visual polish is not a project objective**.
- Kan‑Linux draws inspiration from [Omarchy’s desktop shell](https://github.com/kan-linux/omarchy), and integrates it as our optional early default desktop shell. We port this tasteful shell as an upper-layer UI example to show the capabilities of the Kan-Linux platform. Even if we remove or disable the Omarchy desktop shell in the future due to unexpected reasons, the whole system and graphics infrastructure can still run fully and independently.
- Omarchy-Linux is based on the upstream Arch Linux distribution, while Kan-Linux is built completely from scratch and **does not rely on any upstream Linux distribution**.
- Kan-Linux provides Omarchy-comparable desktop UI and keybindings plus powerful development environments for programmers and AI Agents.

#### Screenshots and LiveISO

Please refer to https://github.com/kan-linux/kan/releases/tag/v0.3.2

## Contributing

Pls refer to [How to contribute to Kan‐Linux](https://github.com/kan-linux/kan/wiki/How-to-contribute-to-Kan%E2%80%90Linux)

## Wiki
https://github.com/kan-linux/kan/wiki


## Limitations
- Currently focus on x86-64 laptops, PCs and hardware
- Tested and verified on limited x86-64 laptops and PCs
- Built-in support for AMD and Intel GPUs. Nvidia GPU support requires assistance from the built-in Agent or a domain specialist
- The installer supports only single-OS installation to a specified partition or a standalone disk among multiple disks; LUKS encryption is not yet supported
- Potential undisclosed vulnerabilities in the Linux kernel and featured components

## Acknowledgements
- Inspired by Omarchy(**"Convention over Configuration"**) and [Omarchy's desktop shell](https://github.com/omacom/omarchy)
- Inspired by [llama.cpp](https://github.com/ggml-org/llama.cpp)
- Thanks to the entire Linux community(various tech orgs, such as Redhat(RHEL/Fedora/QEMU), SPI(Debian), Linux Foundation, Linaro, Canonical(Ubuntu), System76(Pop!_OS), UnionTech(Deepin/UOS)... and tech stacks)
- Special thanks to the AI assistant for extensive technical discussions, architectural advice, and writing assistance throughout the development of Kan-Linux

## Language Policy and AI Policy

- To facilitate clear and effective communication, all discussions, comments, documentation, and PRs in this project **should be** conducted in English, this ensures that all contributors can participate and collaborate effectively.
- English and Chinese are **both fine** for issues, discussions and wiki.
- Discussions, issues and PRs should include **human-written content**. **AI-assisted polish is accepted and welcomed**(many of us are non-native English speakers). What matters is not who typed the content but whether a human understands it.
- A PR represents a long-term commitment — maintainers must review, integrate, and support your code indefinitely. What matters is not who wrote the code but whether a human understands it: **either fully, or at the 70–90% level, and is able to explain major change to reviewers, even with AI assistance**.
- Fully AI-generated content and fully automated PRs are not permitted. We value human connection and communication over fully AI-driven interaction.

## Trademarks
This project may include trademarks or logos belonging to third parties. Use of any third-party trademarks is governed by their respective policies.

