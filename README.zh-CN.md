# 缘之空：高清重制

[English](README.md) | 简体中文

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
运行时已独立归档。正式打包和资源分包命令尚未加入。

## 开发启动

Windows 使用系统自带的 PowerShell 直接运行 KRKRZ，无需安装 Python、编译引擎或
复制素材：

```powershell
.\project.ps1 run windows-krkrz
```

Windows SDL2 版本需要安装 CMake 和 Visual Studio C++ 工具链。第一次需要完整编译，
之后会进行增量编译，同样不需要 Python：

```powershell
.\project.ps1 run windows-sdl2
```

macOS 使用 CMake 创建不包含素材副本的 SDL2 开发构建。第一次需要完整编译，之后
会进行增量编译：

```sh
./project.sh run macos-sdl2
```

需要传递引擎选项时，直接附加到命令末尾：

```sh
./project.sh run macos-sdl2 -about
```

这些启动命令都会直接读取仓库中的 `data/`，修改游戏脚本或素材后无需重新打包。

Kirikiri SDL2 源码使用 MIT 许可证，详见 `LICENSE`。第三方组件适用各自目录中的许可证。
