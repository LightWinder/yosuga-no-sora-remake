# 缘之空游戏重置仓库

本仓库提供《缘之空》重置版的本地游戏运行文件。

## 启动

在游戏根目录运行 `tvpwin32.exe`。

## 说明

用户存档、运行日志、对话记录、测试脚本和临时文件不包含在仓库中。

## 开发环境

游戏内容由本仓库通过 Git LFS 管理，修改后的 Kirikiri SDL2 引擎以
`engine/krkrsdl2` submodule 固定到 `LightWinder/krkrsdl2` 的已验证版本。
引擎内部继续固定 `LightWinder/krkrz` 和其他第三方依赖。

完整克隆：

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

GitHub Actions 中的 `Repository Check` 可手动验证 LFS 素材、递归 submodule
和跨平台内容清单。Android 与 iOS 的正式打包工作流将在资源分包入口完成后加入。
