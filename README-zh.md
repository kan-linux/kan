# Kan-Linux

*See through the delusions, return to simplicity*

**勘破遮蔽，回归本真**

[English](README.md) | 中文


## 简介

**Kan（勘）Linux** 是一款极简、纯净、AI-Agent优先的 桌面Linux 发行版。

名称取自[王阳明](https://zh.wikipedia.org/zh-cn/%E7%8E%8B%E9%99%BD%E6%98%8E)《传习录》：**“此处能勘得破，方是简易透彻功夫。”**

项目以「勘破遮蔽、去芜存真」为核心设计理念，构建精简的底层基座，搭配 Hyprland 现代化 Wayland 桌面栈。

## 核心设计理念

- **纯粹性** — 剔除冗余依赖与老旧渲染层级，摒弃无效技术负担

- **极简性** — 轻量化底层架构，不依赖任何发行版

- **Monorepo** — 汲取现有各类 Linux 发行版的经验教训，采用AOSP风格的单仓库架构。所有全部源码存放/托管于单一代码仓库，简化开发、构建与维护工作。

- **源码构建** — 整套系统及所有组件均支持从源代码编译构建

- **llama.cpp 优先** — 内置原生 llama.cpp 端侧推理引擎，原生支持本地 AI 部署与端侧智能计算

- **Agent First \& Agent Friendly** — 面向智能代理设计，支持 AI Agent 自主编译部署、组件安装、系统自查与问题修复

- **原生 AI 安全审计流水线** —  区别于传统发行版依赖维护团队跟进 CVE、二进制后置审计的安全模式，Kan-Linux 将大模型源码级安全审计（GLM-5.3 及同等级模型）设为编译前的强制准入关卡。将安全防护从「二进制后置扫描」升级为**源码前置准入审计**。


## 与 Omarchy 的区别
- Omarchy 面向终端用户，主打开箱即用的成品桌面系统，**视觉炫酷是其核心目标之一**。
- Kan‑Linux 面向发行版构建者，提供一套中立的 Wayland 底层图形平台；项目核心目标为**可控、可审计、模块化、可复现构建**，**不以视觉炫酷作为项目目标**。
- Kan‑Linux 借鉴 Omarchy 的 Quickshell，仅将其作为**可选上层桌面示例**，用于演示底座能够承载现代炫酷的 Wayland 界面。Quickshell 及其依赖的 Qt 不属于底座本体；关闭或移除 Qt + Quickshell，整套系统与图形基础设施依然完整独立可用。
- Omarchy 基于上游 Arch Linux 发行版构建，而 Kan-Linux 完全从零搭建，**不依赖任何上游 Linux 发行版**，工作量与难度更大。

## 路线图

Kan Linux 逐步适配虚拟化环境与主流硬件平台，覆盖日常开发与桌面使用场景：

- QEMU 虚拟机环境
- x86-64 台式机
- x86-64 笔记本
- aarch64 笔记本(Snapdraon on Linux)

## 如何下载代码

```bash

git clone --recurse-submodules https://github.com/kan-linux/kan.git

```

## 截图与使用说明


详见：[https://github.com/kan-linux/iso](https://github.com/kan-linux/iso)

该仓库存放预编译 rootfs、ISO 镜像、截图以及用户使用指南；本主仓库仅包含源代码。


## 提示

如果本项目 GitHub Star 数量突破 1000，我将会放出完整源码，用户可以直接基于这个单一仓库，编译构建一套类似 Omarchy 的 Wayland 桌面发行版。

除此之外，你也可以使用 [https://github.com/kan-linux/iso](https://github.com/kan-linux/iso) 提供的预编译 rootfs 进行二次定制，生成属于你自己、和 Omarchy 风格相近的 Wayland 桌面发行版。

你同样可以以本仓库为基础，借助强大的 AI 工具，复现我的开发流程、攻克同类难题，从源码构建一套 Omarchy 风格的 Linux 桌面发行版。


## 致谢
- 感谢 [Omarchy Linux](https://github.com/omacom/omarchy) 带来的启发
- 感谢 [LFS (Linux From Scratch)](https://www.linuxfromscratch.org/)项目
- 感谢 [Pop!\_OS ISO](https://github.com/pop-os/iso)
- 感谢 [try-omarchy-linux](https://github.com/zhouwg/try-omarchy-linux)
- 感谢全体 Linux 社区（各种复杂的技术栈）
- 感谢 [llama.cpp](https://github.com/ggml-org/llama.cpp)


## 许可证
本项目采用 MIT 许可证。
