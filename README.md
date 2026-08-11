# 缘之空：高清重制

本仓库是《缘之空》高清重制的完整游戏工程。项目以修改后的
[Kirikiri SDL2](https://github.com/LightWinder/krkrsdl2) 为跨平台运行基础，
同时保留原生 Kirikiri Z Windows 运行时作为兼容版本。

## 项目结构

- `data/`：唯一的游戏内容源，包含脚本、图片、字体、音频和视频素材。
- `src/`：Kirikiri SDL2 引擎及项目适配源码。
- `external/`：SDL、Kirikiri Z 等固定版本的第三方依赖。
- `android-project/`：Android Gradle 工程，构建时直接使用根目录的 `data/`。
- `platform/windows-krkrz/`：原生 Kirikiri Z Windows 运行时、插件和启动配置。
- `tools/`：内容清单及后续发布工具。

## 获取源码

```sh
git clone --recurse-submodules https://github.com/LightWinder/yosuga-no-sora-remake.git
cd yosuga-no-sora-remake
git lfs pull
```

已有工作区更新依赖：

```sh
git submodule sync --recursive
git submodule update --init --recursive
git lfs pull
```

## 当前状态

SDL2 桌面端和 Android 工程均从 `data/` 读取游戏内容。Windows KRKRZ
运行时已独立归档，但各平台的统一打包命令和正式资源分包方案尚未加入。

Kirikiri SDL2 源码使用 MIT 许可证，详见 `LICENSE`。第三方组件适用各自目录中的许可证。
