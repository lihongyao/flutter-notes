# 概述

- [Flutter ↪](https://flutter.dev/) 是 Google 开发的一款开源的、免费的，基于 **Dart 语言** 的UI框架，可以快速在 iOS 和 Android 上构建高质量的原生应用

  它最大的特点就是 **跨平台** 和 **高性能**。

- Dart 是由 Google，在2011年开发的计算机编程语言，它可以被用于 Web、服务器、移动应用和物联网等多个领域。号称要取代 js。

- 资源网站

  - 中文网

    - https://flutterchina.club/
  
    - https://flutter.cn/
  
- 工具包：https://pub.flutter-io.cn/

> 提示：如果没有任何 Dart 语言的基础，不建议直接学习 Flutter。建议先学习Dart语言的基本语法。

# 环境配置

工欲善其事必先利其器，本节首先会介绍一下在 Vscode 下 Flutter SDK的安装，然后再介绍一下配IDE和模拟器的使用。

## 1. 下载SDK

1）点击前往 [下载Flutter SDK ↪](https://docs.flutter.cn/install/archive)，M芯片选择 arm64 架构

2）将下载下来的SDK文件解压缩至指定目录（建议用户目录下新建 `development`）

```bash
$ unzip ~/Downloads/flutter_macos_arm64_3.35.1-stable.zip -d ~/development/
```

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

### 3.1. 安装

下载地址：https://developer.android.com/studio/#downloads

> 提示：首次安装 Android studio 提示 *Android Studio First Run \ Unable to access Android SDK add-on list* 解决方案：
>
> 1. 选择 「Setup proxy」
> 2. 选择 「Manual proxy configuration」- 「HTTP」
>    - Host name：**mirrors.neusoft.edu.cn**
>    - Port number：**80**
> 3. 选择「Check connection」
> 4. 提示 *Connection successful* 配置成功

### 3.2. 安装 Android Studio 必要组件

@See https://docs.flutter.cn/get-started/install/macos/mobile-android#configure-android-development

操作步骤：⚙️ Settings — Languages & Frameworks — Android SDK

确保安装如下组件：

- Android SDK Platform, API 35.0.1
- Android SDK Command-line Tools
- Android SDK Build-Tools
- Android SDK Platform-Tools
- Android Emulator

接下来在配置文件里添加如下代码：（可删除的内容）

```ini
# android
export ANDROID_HOME=$HOME/Library/Android/sdk 
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools
export PATH=$PATH:$ANDROID_HOME/emulator
```

### 3.3. 安装插件

快捷键  `cmd + ,`  打开设置，选择 `Plugins`，搜索安装 `Flutter` 插件。

签署许可证协议

```shell
flutter doctor --android-licenses
```

输入项一路按 `y` 即可

## 4. 配置 Xcode

1）在 appStore 搜索 Xcode 安装即可

2）使用以下命令来将开发者目录指向你完整的 Xcode 安装路径（通常在 /Applications/Xcode.app）：

```bash
sudo xcode-select --switch /Applications/Xcode.app/Contents/Developer
```

3）签署 Xcode 许可证协议

```bash
sudo xcodebuild -license
```

4）安装 cocoapods

```bash
brew install cocoapods
```

## 5. 配置 VSCode

下载安装：https://code.visualstudio.com/

打开VSCode，快捷键 `CMD` + `SHIFT` + `X` 打开拓展程序，搜索并安装 Dart/Flutter 插件。然后再次执行 `flutter doctor` 指令，配置完毕！

## 6. 检查环境

运行以下命令以查看是否需要安装任何依赖项才能完成设置。

```shell
$ flutter doctor
```

此命令检查您的环境并向终端窗口显示报告。

```shell
flutter doctor
Doctor summary (to see all details, run flutter doctor -v):
[✓] Flutter (Channel stable, 3.24.2, on macOS 14.6.1 23G93 darwin-arm64, locale
    zh-Hans-CN)
[✓] Android toolchain - develop for Android devices (Android SDK version 35.0.0)
[✓] Xcode - develop for iOS and macOS (Xcode 15.4)
[✓] Chrome - develop for the web
[✓] Android Studio (version 2024.1)
[✓] VS Code (version 1.93.0)
[✓] Connected device (3 available)
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

### 2. 安装插件

- `Flutter`： 支持Flutter开发工作流 (运行、调试、热重载等)
- `Dart`：提供代码分析 (输入代码时进行验证、代码补全等)

步骤：`启动 Visual Studio Code `  → `快捷键：CMD(CTR) + SHIFT + X` → `搜索并安装插件` → `重启 Visual Studio Code`

> **！提示**：安装 `Flutter` 插件时会自动安装 `Dart` 插件。

### 3. 创建项目

## 2. 安装插件

快捷键： <kbd>Command</kbd> + <kbd>Shift</kbd> + <kbd>X</kbd>

装插件：`flutter`

> **！提示**：安装 `Flutter` 插件时会自动安装 `Dart` 插件。

## 3. 安装 SDK

1. 要打开**命令面板** ，请按 <kbd>Command</kbd> + <kbd>Shift</kbd> + <kbd>P</kbd>

2. 在**命令面板**中，键入 `flutter`
3. 选择 `Flutter：New Project`
4. VS Code 会提示你在计算机上找到 Flutter SDK
   - 如果你安装了 Flutter SDK，请单击 **Locate SD**
   - 如果没有安装 Flutter SDK，请单击**下载 SDK**（推荐安装位置：`~/development`，如果没有这个目录可以手动创建）
5. 当提示“ **哪个 Flutter 模板？”** 时，请忽略它。按 <kbd>Esc</kbd> 。您可以在检查开发设置后创建测试项目。

步骤：`启动 Visual Studio Code ` → `CMD(CTR) + SHIFT + P`  → `Flutter:New Project` → `Application`  → `Select Folder` → `Enter Project Name`

### 4. 配置模拟器

#### 4.1. Android

**步骤**：`CMD(CTR) + SHIFT + P`  → `Flutter:Select Device` → `+ Create Android emulator` 

如果提示： *No suitable Android AVD system images are available. You may need to install these using sdkmanager, for example: sdkmanager "system-images;android-27;google_apis_playstore;x86"*

在 `Android Studio` 中创建虚拟设备(模拟器) → 重复上次步骤 → 选择设备，耐心等待启动...

#### 4.2. iOS

**Tips**：coming soon...

#### 5. 运行项目

终端输入：`flutter run`

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

# 创建项目

1、在终端输入如下指令创建项目

```shell
$ flutter create --empty <project-name>
$ cd <project-name> && code .
$ flutter run
```

> 提示：
>
> - `--empty` 标记会导致无法在 `lib/main.dart` 文件中创建标准计数器应用。
> - 如果是正式开发，建议使用 Android studio 创建项目，然后再使用 vscode 来开发。

2、目录解构如下

```
<project-name>
├── android （android平台相关代码）
├── assets （静态资源）
│   ├── images
│   └── fonts
├── ios （ios平台相关代码）
├── lib（flutter 相关代码，我们编写的代码就在这个文件夹）
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
├── analysis_options.yaml （分析 dart 语法的文件，老项目升级新项目有报错可删除）
├── pubspec.lock（项目依赖锁定信息）
└── pubspec.yaml（项目依赖配置）
```

3、
