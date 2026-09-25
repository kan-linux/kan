# Kan-Linux

*See through the delusions, return to simplicity*

**勘破遮蔽，回归本真**

[English](README.md) | 中文

---


## 简介

**Kan（勘）Linux** 是一款极简、纯净、AI-Agent优先的 桌面Linux 发行版，计划 2026‑10‑01 发布。

名称取自[王阳明](https://zh.wikipedia.org/zh-cn/%E7%8E%8B%E9%99%BD%E6%98%8E)《传习录》：**“此处能勘得破，方是简易透彻功夫。”**

项目以「勘破遮蔽、去芜存真」为核心设计理念，努力剥离传统 Linux 桌面老旧臃肿的 X11/GTK 图形体系与历史技术债。构建极致精简的底层基座，搭配 Qt \+ Hyprland 现代化 Wayland 桌面栈，实现系统**寂然不动，感而遂通**的运行状态，闲时沉静无冗余，响应交互通透高效。

## 核心设计理念

- **纯粹性** — 剔除冗余依赖与老旧渲染层级，摒弃无效技术负担

- **极简性** — 轻量化底层架构，无多余系统开销

- **现代化** — 纯 Wayland 原生架构，彻底舍弃老旧 X11 体系

- **源码构建** — 整套系统及所有组件均支持从源代码编译构建，适配 AI Agent 智能编译、自动部署与智能修复

- **llama.cpp 优先** — 内置原生 llama.cpp 端侧推理引擎，原生支持本地 AI 部署与端侧智能计算

- **Agent First \& Agent Friendly** — 面向智能代理设计，支持 AI Agent 自主编译部署、组件安装、系统自查与问题修复


- **真正的 Agent 优先** — 市面上绝大多数「智能代理优先」系统，仅是在 Ubuntu、Nix、Arch 等传统发行版上预装 AI 工具。这类系统依然依赖传统包管理器（`deb`/`rpm`/`nix`/`pacman`）、二进制软件仓库与旧式系统状态逻辑。在这些系统中，**AI 代理只是可选附加工具**，仅是辅助应用，并非系统运行的必要核心。Kan-Linux 仅提供极简、源码构建、可审计的系统基底, 非预置上层软件扩展、依赖解析、ABI 一致性校验、部署编排工作**依赖 AI 代理执行**。

- **原生 AI 安全审计流水线** —  区别于传统发行版依赖维护团队跟进 CVE、二进制后置审计的安全模式，Kan-Linux 将大模型源码级安全审计（GLM-5.3 及同等级模型）设为编译前的强制准入关卡。将安全防护从「二进制后置扫描」升级为**源码前置准入审计**。


---

## 路线图

Kan Linux 逐步适配虚拟化环境与主流硬件平台，覆盖日常开发与桌面使用场景：

- QEMU 虚拟机环境
- x86-64 台式机
- x86-64 笔记本
- aarch64 笔记本(Snapdraon on Linux)

---

## 致谢
- 感谢 [Omarchy Linux](https://github.com/omacom/omarchy) 带来的启发
- 感谢 [LFS (Linux From Scratch)](https://www.linuxfromscratch.org/)项目
- 感谢 [Pop!\_OS ISO](https://github.com/pop-os/iso)
- 感谢 [try-omarchy-linux](https://github.com/zhouwg/try-omarchy-linux)
- 感谢全体 Linux 社区（各种复杂的技术栈）
- 感谢 [llama.cpp](https://github.com/ggml-org/llama.cpp)

---

## 许可证
本项目采用 MIT 许可证。

欢迎 Fork 本仓库并提交 Pull Request。
若复用本项目的代码或相关资料，**请注明来源**。
