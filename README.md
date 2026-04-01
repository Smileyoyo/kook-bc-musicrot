# KOOK 音乐机器人 (Java 版本)

基于 JKook API 和 KookBC 开发的 KOOK 音乐机器人框架。

## 当前状态

✅ **编译成功** - 插件框架可以正常编译和加载到 KookBC
⏳ **功能开发中** - 需要继续开发音乐点歌功能

## 快速开始（Windows）

### 一键编译安装

双击运行 `build-and-install.bat`

按照提示输入 KookBC 安装目录即可。

### 分步操作

#### 1. 编译项目

双击运行 `build.bat`

输出文件：`build\libs\kook-music-bot.jar`

#### 2. 安装到 KookBC

双击运行 `install.bat`

按照提示输入 KookBC 的安装目录，例如：
```
C:\KookBC
```

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
- **Gradle**: 构建工具

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
| `build.gradle.kts` | Gradle 构建配置 |

## 相关资源

- JKook API: https://github.com/SNWCreations/JKook
- KookBC: https://github.com/SNWCreations/KookBC
- KOOK 开发者: https://developer.kookapp.cn

## 开发日志

### 2026-04-02
- ✅ 创建干净的项目结构
- ✅ 配置 Gradle 构建
- ✅ 创建 Windows 批处理脚本
- ✅ 编译成功
- ⏳ 继续开发功能

## 常见问题

### Q: 编译失败，提示找不到 JKook API
**A:** 需要手动安装 JKook 到本地 Maven 仓库。

下载 JKook JAR 文件后运行：
```powershell
mvn install:install-file -Dfile=jkook-0.54.2.jar -DgroupId=io.github.snwcreations -DartifactId=jkook -Dversion=0.54.2 -Dpackaging=jar
```

## 许可证

MIT License
