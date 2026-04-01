# KOOK 音乐机器人 (Java 版本)

基于 JKook API 和 KookBC 开发的 KOOK 音乐机器人框架。

## 当前状态

✅ **编译成功** - 插件框架可以正常编译和加载到 KookBC
⏳ **功能开发中** - 需要继续开发音乐点歌功能

## 快速开始（Windows）

### 1. 克隆项目

```powershell
git clone https://github.com/Smileyoyo/kook-bc-musicrot.git E:\后台\后台\kook-bc-musicrot
```

### 2. 一键编译安装

双击运行 `build-and-install.bat`

**首次运行**：会自动下载 Gradle Wrapper，需要几分钟，请耐心等待。

按照提示输入 KookBC 安装目录即可，例如：
```
C:\KookBC
```

### 3. 启动 KookBC

```powershell
cd C:\KookBC
java -jar kookbc-0.33.0.jar
```

## 分步操作

#### 1. 编译项目

双击运行 `build.bat`

**首次运行**：会自动下载 Gradle Wrapper。

输出文件：`build\libs\kook-music-bot.jar`

#### 2. 安装到 KookBC

双击运行 `install.bat`

按照提示输入 KookBC 的安装目录。

#### 3. 启动 KookBC

```powershell
cd C:\KookBC
java -jar kookbc-0.33.0.jar
```

## 技术栈

- **Java**: 11+
- **JKook API**: 0.54.2（由 KookBC 提供）
- **KookBC**: 0.33.0
- **OkHttp**: HTTP 客户端
- **Gson**: JSON 处理
- **Gradle**: 构建工具（8.5）

## 功能计划

- [ ] 基础框架
- [ ] 歌曲解析（网易云、QQ音乐、Bilibili）
- [ ] 队列管理
- [ ] 点歌命令
- [ ] 播放控制
- [ ] 卡片交互

## 文件说明

| 文件 | 说明 |
|------|------|
| `build.bat` | 编译项目，生成 JAR 文件 |
| `install.bat` | 安装到 KookBC modules 目录 |
| `build-and-install.bat` | 一键编译和安装 |
| `gradlew.bat` | Gradle Wrapper（Windows） |
| `build.gradle.kts` | Gradle 构建配置 |

## 常见问题

### Q: 首次运行显示"正在下载 Gradle Wrapper"
**A:** 这是正常的，Gradle 会自动下载必要的文件（约 100MB），需要几分钟。

### Q: 编译失败，提示找不到 Java
**A:** 请确保已安装 Java 11 或更高版本，并设置 JAVA_HOME 环境变量。

### Q: 编译失败，提示找不到 JKook API
**A:** JKook API 会自动从 JitPack 下载。如果失败，请检查网络连接。

### Q: 启动 KookBC 后没有加载插件
**A:** 检查：
1. JAR 文件是否正确复制到 `modules` 目录
2. KookBC 版本是否为 0.33.0 或更高
3. 查看控制台日志，是否有错误信息

## 相关资源

- JKook API: https://github.com/SNWCreations/JKook
- KookBC: https://github.com/SNWCreations/KookBC
- KOOK 开发者: https://developer.kookapp.cn

## 开发日志

### 2026-04-02
- ✅ 创建干净的项目结构
- ✅ 配置 Gradle 构建
- ✅ 添加 Gradle Wrapper 支持
- ✅ 创建 Windows 批处理脚本
- ✅ 首次运行自动下载依赖
- ⏳ 继续开发功能

## 许可证

MIT License
