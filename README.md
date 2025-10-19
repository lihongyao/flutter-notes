# 概述

- [Flutter ↪](https://flutter.dev/) 是 Google 开发的一款开源的、免费的，基于 **Dart 语言** 的UI框架，可以快速在 iOS 和 Android 上构建高质量的原生应用

  它最大的特点就是 **跨平台** 和 **高性能**。

- Dart 是由 Google，在2011年开发的计算机编程语言，它可以被用于 Web、服务器、移动应用和物联网等多个领域。

- 中文网：https://flutter.cn/

- 工具包：https://pub.flutter-io.cn/

> 提示：如果没有任何 Dart 语言的基础，不建议直接学习 Flutter。建议先学习Dart语言的基本语法。

# 环境配置

工欲善其事必先利其器，本节首先会介绍一下在 Vscode 下 Flutter SDK的安装，然后再介绍一下配IDE和模拟器的使用。

## 1. 下载SDK

### 手动安装

1）点击前往 [下载Flutter SDK ↪](https://docs.flutter.cn/install/archive)，M芯片选择 arm64 架构

2）将下载下来的SDK文件解压缩至指定目录（建议用户目录下新建 `development`）

```bash
$ unzip ~/Downloads/flutter_macos_arm64_3.35.1-stable.zip -d ~/development/
```

### 使用 VS Code 安装（推荐）

1. 打开命令面板 ，请按 <kbd>Command</kbd> + <kbd>Shift</kbd> + <kbd>P</kbd>

2. 在命令面板中，键入 **flutter**

3. 选择 **Flutter：New Project**

4. VS Code 会提示你在计算机上找到 Flutter SDK

   - 如果你安装了 Flutter SDK，请单击 **Locate SD**
   - 如果没有安装 Flutter SDK，请单击**下载 SDK**

5. 当显示 **Select Folder for Flutter SDK**  对话框时，选择要安装 Flutter 的位置（推荐安装位置：`~/development`，如果没有这个目录可以手动创建）

6. 单击 **clone Flutter**

   下载 Flutter 时，VS Code 会显示此弹出通知：

   ```
   Downloading the Flutter SDK. This may take a few minutes.
   ```

   下载需要几分钟时间。如果您怀疑下载已挂起，请点击**“取消”**，然后重新开始安装。

7. 单机  **Add SDK to PATH**

   成功后，将显示通知：

   ```
   The Flutter SDK was added to your PATH
   ```

8. 当提示 **Which Flutter template?** 时，请忽略它。按 <kbd>Esc</kbd> 。您可以在检查开发设置后创建测试项目。

9. 为确保 Flutter 在所有终端中可用：

   - 关闭，然后重新打开所有终端窗口。
   - 重新启动 VS Code。

步骤：`启动 Visual Studio Code ` → `CMD(CTR) + SHIFT + P`  → `Flutter:New Project` → `Application`  → `Select Folder` → `Enter Project Name`

## 2. 配置环境变量

在终端输入 `vi ~/.bash_profile`，按 <kbd>i</kbd> 进入编辑模式，添加如下代码：

```ini
# Flutter_国内镜像 
export PUB_HOSTED_URL="https://pub.flutter-io.cn"
export FLUTTER_STORAGE_BASE_URL="https://storage.flutter-io.cn"
# Flutter_环境变量
export FLUTTER="$HOME/development/flutter/bin"

export PATH=$PATH:$FLUTTER
```

按住 <kbd>Esc</kbd>，输入 <kbd>wq!</kbd> 保存并退出，然后刷新配置文件：

```shell
$ source ~/.bash_profile 
```

验证结果：

```shell
$ flutter --version
Flutter 3.35.1 • channel stable • https://github.com/flutter/flutter.git
Framework • revision 20f8274939 (2 天前) • 2025-08-14 10:53:09 -0700
Engine • hash 6cd51c08a88e7bbe848a762c20ad3ecb8b063c0e (revision 1e9a811bf8) (3
days ago) • 2025-08-13 23:35:25.000Z
Tools • Dart 3.9.0 • DevTools 2.48.0
```

## 3. 配置Android Studio

@See https://docs.flutter.dev/platform-integration/android/setup

### 3.1. 安装

下载地址：https://developer.android.com/studio?hl=zh-cn

> 提示：首次安装 Android studio 提示 *Android Studio First Run \ Unable to access Android SDK add-on list* 解决方案：
>
> 1. 选择 **Setup proxy**
> 2. 选择 **Manual proxy configuration**- **HTTP**
>    - Host name：**mirrors.neusoft.edu.cn**
>    - Port number：**80**
> 3. 选择 **Check connection**
> 4. 提示 *Connection successful* 配置成功

### 3.2. 安装 Android Studio SDK 和工具

1. 启动 **Android Studio**

2. 打开 **SDK Manager** 设置对话框

   - 如果 “**Welcome to Android Studio**” 对话框已打开，单击 **More Actions** 按钮，然后从下拉菜单中单击 “**SDK Manager**”。
   - 如果您已打开项目，请转至 **Tools** > **SDK Manager**。

3. 如果 **SDK Platforms** 选项卡未打开，请切换到该选项卡。

4. 验证是否已选择 **API Level** 为 **36** 的第一个条目。

   如果 **Status** 列显示 **Update available** 或者 **Not installed**：

   - 选中当前行
   - 点击 **Apply**
   - 当显示确认更改框时，点击确认，等待安装
   - 安装完成之后点击 **Finis h**

5. 切换到 **SDK Tools** 选项卡

6. 验证是否已选择以下 SDK 工具

   - **Android SDK Build-Tools**
   - **Android SDK Command-line Tools**
   - **Android Emulator**
   - **Android SDK Platform-Tools**

7. 如果有更改，和第4步一致，点击 **Apply** 安装，等待安装完成之后点击 **Finish** 即可。

### 3.3. 同意 Android 许可

1. 打开终端

2. 运行以下命令来审查并签署 SDK 许可证

   ```shell
   $ flutter doctor --android-licenses
   ```

3. 阅读并接受任何必要的许可。

   如果您之前没有接受过每个 SDK 许可证，则需要在开发 Android 之前查看并同意这些许可证。

   在同意每个许可的条款之前，请仔细阅读每个条款。

   成功接受所有必要的许可证后，您应该会看到类似以下内容的输出：

   ```
   All SDK package licenses accepted.
   ```

### 3.4. 安装插件

快捷键  `cmd + ,`  打开设置，选择 `Plugins`，搜索安装 `Flutter` 插件。

### 3.5. 设置安卓设备

@See https://docs.flutter.dev/platform-integration/android/setup#set-up-devices

查看设备：

```shell
$ flutter emulators && flutter devices
```

## 4. 配置 Xcode

### 4.1. 安装

[请安装并设置最新版本的 Xcode](https://developer.apple.com/xcode/)

### 4.2. 设置 Xcode 命令行工具

要配置 Xcode 命令行工具以使用您安装的 Xcode 版本，请在您首选的终端中运行以下命令：

```bash
$ sudo sh -c 'xcode-select -s /Applications/Xcode.app/Contents/Developer && xcodebuild -runFirstLaunch'
```

如果您在其他地方下载了 Xcode 或需要使用其他版本，请将其替换`/Applications/Xcode.app`为那里的路径。

### 4.3. 签署 Xcode 许可证协议

设置 Xcode 并配置其命令行工具后，请同意 Xcode 许可证。

```bash
$ sudo xcodebuild -license
```

### 4.4. 下载必备工具

下载 iOS 平台支持和最新的 iOS 模拟器运行

```shell
$ xcodebuild -downloadPlatform iOS
```

### 4.5. 安装 Rosetta

如果您在[Apple Silicon](https://support.apple.com/en-us/116943) (ARM) Mac 上进行开发，[请安装 Rosetta 2](https://support.apple.com/en-us/102527)：

```shell
$ sudo softwareupdate --install-rosetta --agree-to-license
```

### 4.6. 安装 CocoaPods

```shell
$ brew install cocoapods
$ pod --version
1.16.2
```

### 4.7. 设置苹果设备

@See https://docs.flutter.dev/platform-integration/ios/setup#set-up-devices

## 5. 配置 VSCode

下载安装：https://code.visualstudio.com/

## 6. 检查环境

运行以下命令以查看是否需要安装任何依赖项才能完成设置。

```shell
$ flutter doctor
```

此命令检查您的环境并向终端窗口显示报告。

```shell
$ flutter doctor
Doctor summary (to see all details, run flutter doctor -v):
[✓] Flutter (Channel stable, 3.35.6, on macOS 26.0 25A354 darwin-arm64, locale
    zh-Hans-CN)
[✓] Android toolchain - develop for Android devices (Android SDK version 36.1.0)
[✓] Xcode - develop for iOS and macOS (Xcode 26.0.1)
[✓] Chrome - develop for the web
[✓] Android Studio (version 2025.1)
[✓] VS Code (version 1.105.1)
[✓] Connected device (2 available)
[✓] Network resources

• No issues found!
```

按照检测结果的说明，如果有 `[!]` 或者 `✗`  标志，表示本行检测不通过，需要做一些设置或者安装一些软件。

# IDEs

## IDE：Android Studio

### 1. 安装插件

- `Flutter`： 支持Flutter开发工作流 （运行、调试、热重载等）
- `Dart`：提供代码分析 （输入代码时进行验证、代码补全等）

1）启动 `Android Studio` 

2）打开插件首选项（macOS：**Preferences → Plugins**，Windows：**File → Settings → Plugins**）

3）`搜索插件` → `Install` → `Restart IDE`

### 2. 创建项目

1）选择 `File` → `New` → `New Flutter Project...` → `Next`

2）配置项目信息 → `Finish`

项目信息：

- `Project name`：项目名称
- `Project location`：项目位置
- `Organization`：包名
- ...

### 3. 运行应用程序

1）定位到 `Android Studio` 工具栏

2）在 `Target selector` 中，选择一个运行该应用的 Android 设备，如果没有列出可用，请选择 `AVD Manager` 并创建一个（参照后文：创建模拟器）。

3）点击 `run`，运行程序。

### 3. 创建模拟器

1）打开 `Android Studio` / 或者在工具栏点击 `AVD Manager` 图标。

![](./IMGS/android_avd_1.png)

> 提示：如果在 `Android Studio` 中打开了项目，则在工具栏找到 `AVD Manager` 的图标点击即可。

2）选择 `+ Create Virtual Device...`

3）选择模拟器

![](./IMGS/android_avd_2.png)

> 提示：你可以根据你的需要选择模拟器的机型。

4）`Select a system image` → 选择 **R** 即可 → `Next`  → `Verify Configuration(可命名虚拟设备)` →  `Finish`

![](./IMGS/android_avd_3.png)

> 提示：上图显示代表创建完成。

## IDE：Visual Studio Code（推荐）

### 1. 安装IDE

下载安装 [Visual Studio Code >>](https://code.visualstudio.com/)

### 2. 将 Flutter 扩展添加到 VS Code

快捷键： <kbd>Command</kbd> + <kbd>Shift</kbd> + <kbd>X</kbd>

搜插件：[`flutter`](https://marketplace.visualstudio.com/items?itemName=Dart-Code.flutter)

> **！提示**：安装 `Flutter` 插件时会自动安装 `Dart` 插件。

# 创建项目

1. 打开 VS Code

2. 快捷键  <kbd>Command</kbd> + <kbd>Shift</kbd> + <kbd>P</kbd> 打开命令面板，输入 flutter

3. 选择 Flutter:New Project

4. 选择 **Application** 模板

5. 创建或选择新应用程序文件夹的父目录

   应该会出现一个文件对话框。

   - 选择或创建您想要创建项目的父目录。
   - 要确认您的选择，请单击 **Select a folder to create the project in**

6. 输入您的应用程序的名称

7. 等待项目初始化完成

8. 打开`lib`目录，然后`main.dart`打开文件。

# 启动项目

虽然 Flutter 应用程序可以在许多平台上运行，但请尝试在 Web 上运行您的新应用程序。

1. 在 VS Code 中打开命令面板  <kbd>Command</kbd> + <kbd>Shift</kbd> + <kbd>P</kbd> 
2. 在命令面板中，开始输入`flutter:` 
3. 选择  **Select Device** 命令，然后选择 **Chrome**
4. 运行或开始调试您的应用程序

> 提示：或者可以使用命令 `flutter run`

# 通用目录结构

```ini
nodejs
├── android（安卓目录）
├── build（构建目录）
├── lib（开发目录：相当于src目录）
│   ├── entities（实体）
│   ├── generated（生成的静态资源）
│   ├── model（数据层）
│   ├── view（视图层）
│   ├── viewmodel
│   ├── routes（路由映射）
│   ├── utils（工具类）
│   │   ├── constants.dart
│   │   └── http.dart 
│   ├── widgets（全局组件）
│   ├── app.dart（根组件）
│   └── main.dart（入口文件：相当于index.js）
├── pubspec.lock（项目依赖锁定信息，相当于npm中的 package-lock.json）
└── pubspec.yaml（项目依赖配置，相当于npm中的 package.json）
```
