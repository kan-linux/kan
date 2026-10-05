<p align="center">
  <picture>
    <source
      media="(prefers-color-scheme: dark)"
      srcset="/assets/kanlinux-banner.png"
    />
    <source
      media="(prefers-color-scheme: light)"
      srcset="/assets/kanlinux-banner.png"
    />
    <img
      src="/assets/kanlinux-banner.png"
      alt="Kan-Linux — a **Simplicity**, **Source‑Built**, **Agent‑First** Linux distro."
      width="1086"
    />
  </picture>
</p>

<!--<h1 align="center">Kan-Linux</h1>-->

<p align="center">
  <a href="/README.md">English</a> |
  <strong>简体中文</strong> |
  <a href="/docs/README.fr.md">Français</a> 
</p>

**Kan（勘）Linux** 是一款简洁、源码构建、AI-Agent优先的 桌面Linux 发行版。

名称取自[王阳明](https://zh.wikipedia.org/zh-cn/%E7%8E%8B%E9%99%BD%E6%98%8E)《传习录》：**“此处能勘得破，方是简易透彻功夫。”**

项目以「勘破遮蔽、回归本真」为核心设计理念，构建精简的底层基座，搭配 Hyprland 现代化 Wayland 桌面栈。

## 核心设计理念

- **极简性** — 消除过度封装与过度设计，不依赖已有任何Linux发行版

- **Monorepo** — 汲取现有各类 Linux 发行版的经验教训尤其是高度复杂/过度设计的[Yocto](https://www.yoctoproject.org/)项目的经验教训，采用AOSP风格的单仓库架构。所有全部源码存放/托管于单一代码仓库，简化开发、构建与维护工作。

- **源码构建** — 整套系统及所有组件均支持从源代码编译构建

- **llama.cpp 优先** — 内置原生 llama.cpp 端侧推理引擎，原生支持本地 AI 部署与端侧智能计算

- **Agent First \& 原生 AI 安全审计流水线** — 面向智能代理设计，支持 AI Agent 自主编译部署、组件安装、系统自查与问题修复。Kan-Linux 将大模型源码级安全审计（GLM-5.3 及同等级模型）设为编译前的强制准入关卡。将安全防护从「二进制后置扫描」升级为**源码前置准入审计**。


## 与 Omarchy 的区别与联系
- Omarchy 面向终端用户，主打开箱即用的成品桌面系统，**视觉炫酷是其核心目标之一**。
- Kan‑Linux 面向专业/职业Linux程序员与发行版构建者，提供一套中立的 Wayland 底层图形平台；项目核心目标为**可控**、**可审计(没有任何黑盒/后门，你清楚你所使用的Linux OS的每个组件)**、**模块化、可复现构建**，**不以视觉炫酷作为项目目标**。
- Kan‑Linux 借鉴了 [Omarchy 的桌面 Shell](https://github.com/kan-linux/omarchy)，将其集成作为可选的早期默认桌面。我们移植该 Shell 作为上层 UI 示例，用以展示 Kan-Linux 平台能力。未来即使移除或禁用 Omarchy Shell，整套系统与图形基础设施仍可完整独立运行。
- Omarchy 基于上游 Arch Linux 发行版构建，而 Kan-Linux 完全从零搭建，**不依赖任何上游 Linux 发行版**，工作量与难度更大。


## 路线图
- 在 QEMU 虚拟机中完成概念验证（stage-1，已完成）
- 在 QEMU 虚拟机中增加登录管理器与完整桌面环境（stage-2.1）
- 支持 Kan-Linux 在实体 x86-64 台式机运行（stage-2.2）
- 支持 Kan-Linux 在实体 x86-64 笔记本运行（stage-2.3）
- 在 QEMU 虚拟机的桌面环境中内置AI智能代理（stage-2.4）
- 在实体 x86-64 台式机/笔记本的桌面环境中测试/验证 AI智能代理（stage-2.5）
- AArch64 笔记本（stage-3）
  
## 如何下载代码

```bash

git clone --recurse-submodules https://github.com/kan-linux/kan.git

```

## 截图与使用说明


详见：[https://github.com/kan-linux/iso](https://github.com/kan-linux/iso)

该仓库存放预编译 rootfs、ISO 镜像、截图以及用户使用指南；本主仓库仅包含源代码。


## 提示

你可以使用 [https://github.com/kan-linux/iso](https://github.com/kan-linux/iso) 提供的预编译 rootfs 进行二次定制，生成属于你自己、和 Omarchy 风格相近的 Wayland 桌面发行版。

你同样可以以本仓库为基础，借助强大的 AI 工具，复现已经验证过的开发流程、解决同类问题，从源码构建一套 Omarchy 风格的 Linux 桌面发行版。

现在，我们已经基本**彻底弄清楚**了Omarchy Linux的原理，已经可以独立从我们自己挑选/适配/调试过的源代码(Omarchy在Github上的众多开源项目中最有价值的是开源了[一个shell桌面](https://github.com/omacom/omarchy)的源代码，对于构建Linux发行版而言最重要的组件基本都没有开源）构建出一个简化版的Omarchy（剔除了很多不适合中国国情/中国市场的组件）。Omarchy官网上有一篇文章，说[阿里云向Omarchy基金会赞助**300万美元**](https://omarchy.org/news/2026/09/alibaba-cloud-joins-as-founding-corporate-patron/)，Kan-Linux项目充分说明基于强大的Linux社区与强大的AI从源代码从零构建一个Agent-First Linux发行版并非很困难。当然，将Linux桌面做的很炫酷很稳定很完善**非常不容易**，这也是Linux desktop几十年以来最大的坑; 同时，构建一个真正Agent-First的Linux发行版，必须要有AI专家的参与，这是我们调研了很多 computer-use agent 项目后的感受。如果有中国公司(华为，小米，联想，海光，...)/美国公司(Intel, AMD, Dell, System76...)对此项目感兴趣，愿意提供支持/赞助(比如额度充足的Code Plan，......当前最需要的是一台性能非常非常强大的x86-64 Linux物理机器用于构建kan-linux，会大大提高开发效率)，请用中文/英文给项目维护人发邮件(zhouwg2000@gmail.com)，谢谢！


## 致谢
- 感谢 [Omarchy Linux](https://github.com/omacom/omarchy) 带来的启发
- 感谢 [LFS (Linux From Scratch)](https://www.linuxfromscratch.org/)项目
- 感谢 [Pop!\_OS ISO](https://github.com/pop-os/iso)
- 感谢 [try-omarchy-linux](https://github.com/zhouwg/try-omarchy-linux)
- 感谢全体 Linux 社区（各种复杂的技术栈）
- 感谢 [llama.cpp](https://github.com/ggml-org/llama.cpp)


## 许可证
本项目采用 MIT 许可证。
