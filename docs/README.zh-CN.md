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
  <strong>简体中文</strong> 
</p>

**Kan（勘）Linux** 是一款借鉴了llama.cpp与omarchy核心理念而重新打造的简洁、源码构建、AI-Agent优先的Linux发行版。

名称取自[王阳明](https://zh.wikipedia.org/zh-cn/%E7%8E%8B%E9%99%BD%E6%98%8E)《传习录》：**“此处能勘得破，方是简易透彻功夫”**。

项目以「勘破遮蔽、回归本真」为核心设计理念，构建精简、安全、Agent优先的全新Linux桌面发行版：面向本地PC/笔记本与云端虚拟机。

## 核心设计理念

- **简洁性** — 参考[ggml/llama.cpp](https://github.com/ggml-org/llama.cpp)项目的核心理念，拒绝过度封装与过度设计，不依赖已有任何Linux发行版

- **Monorepo** — 汲取现有各类 Linux 发行版的经验教训尤其是高度复杂/过度设计的[Yocto](https://www.yoctoproject.org/)项目的经验教训，采用AOSP风格的单仓库架构。所有全部源码存放/托管于单一代码仓库，简化开发、构建与维护工作。同时汲取了各种Linux发行版的教训与AOSP的经验，采取“声明式配置”与不可变架构“的代码/组件管理方式，大幅度降低维护负担，同时缩小漏洞攻击面。

- **源码构建** — 整套系统及所有组件（Go,Rust,Firefox为官方发布的二进制）均支持从源代码编译构建

- **llama.cpp 优先** — 内置原生 llama.cpp 端侧推理引擎，原生支持本地 AI 部署与端侧智能计算

- **Agent First** — Kan-Linux不依赖任何已有Linux发行版，没有各种发行版自带的复杂包管理器，对于非程序员用户，Agent是必须的而非仅仅只是口号。面向智能代理设计，支持AI Agent自主编译组件、安装组件、系统自查与问题修复

- **原生 AI 安全审计流水线** — Kan-Linux 将大模型源码级安全审计（GLM-5.3 及同等级模型）设为编译前的强制准入关卡。将安全防护从「二进制后置扫描」升级为**源码前置准入审计**。


## 与 Omarchy 的区别与联系
- Omarchy 面向终端用户，主打开箱即用的成品桌面系统，**视觉炫酷是其核心目标之一**。
- Kan‑Linux 面向程序员与AI领域人士，项目核心目标为**可控**、**可审计(没有任何黑盒/后门，你清楚你所使用的Linux OS的每个组件)**、**模块化、可复现构建**，**不以视觉炫酷作为项目目标**。
- Kan‑Linux 借鉴了Omarchy的核心理念“约定大于配置”与 [Omarchy 的桌面 Shell](https://github.com/kan-linux/omarchy)，将其集成作为可选的早期默认桌面。我们移植该 Shell 作为上层 UI 示例，用以展示 Kan-Linux 平台能力。未来即使移除或禁用 Omarchy Shell，整套系统与图形基础设施仍可完整独立运行。
- Omarchy 基于上游 Arch Linux 发行版构建，而 Kan-Linux 完全从零搭建，**不依赖任何上游 Linux 发行版**。


## 路线图
- 在 QEMU 虚拟机中完成概念验证（stage-1，已完成）
- 在 QEMU 虚拟机中增加登录管理器与完整桌面环境（stage-2.1，已完成）
- 支持在虚拟机虚拟磁盘中安装 Kan-Linux，初步达到可使用程度（stage-2.2，已完成）
- 支持 Kan-Linux 在实体 x86-64 台式机/笔记本运行（stage-2.3）
- 在 QEMU 虚拟机的桌面环境中内置AI智能代理（stage-2.4）
- 在实体 x86-64 台式机/笔记本的桌面环境中测试/验证 AI智能代理（stage-2.5）
- 完善Kan-Linux中定制的Omarchy shell桌面（stage-2.6）
- 完善Kan-Linux for x86-64(stage-3)
- AArch64 笔记本（stage-4，最初有计划，后来限于资源有限移除AArch64计划，不一定做，也可能做：因为构建系统已经设计为支持多架构:x86-64, aarch64, 龙芯）
  

## 截图与LiveISO
详见：https://github.com/kan-linux/kan/releases/tag/v0.2.9


## 致谢
- 感谢 [Omarchy Linux](https://github.com/omacom/omarchy) 带来的启发
- 感谢 [llama.cpp](https://github.com/ggml-org/llama.cpp)
- 感谢全体 Linux 社区（各个专业技术组织与各种复杂的技术栈）
- 感谢中国AI大模型以及Agent的专业帮助(我们也想体验美国最先进的AI大模型以及Agent，但限于众所周知的原因尤其支付难题，没有机会体验）


## 许可证
本项目采用 MIT 许可证。

## 商标声明
本项目可能包含第三方商标或标识，第三方商标的使用需遵守其各自的相关规定。

