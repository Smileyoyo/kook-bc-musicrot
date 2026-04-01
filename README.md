# KOOK 音乐机器人 (Java 版本)

基于 JKook API 和 KookBC 开发的 KOOK 音乐机器人框架。

## 当前状态

✅ **编译成功** - 插件框架可以正常编译和加载到 KookBC
⏳ **功能开发中** - 需要继续开发音乐点歌功能

## 快速开始（Windows）

### 前置要求

- ✅ Java 11 或更高版本
- ✅ 网络连接（下载依赖）

### 1. 克隆项目

```powershell
git clone https://github.com/Smileyoyo/kook-bc-musicrot.git E:\后台\后台\kook-bc-musicrot
```

### 2. 检查环境

```powershell
check-env.bat
```

### 3. 编译项目

#### 方式 1：使用 Gradle（推荐）

```powershell
build-and-install.bat
```

**首次运行**：会自动下载 Gradle Wrapper（约 100MB），需要几分钟，请耐心等待。

#### 方式 2：使用 Maven

```powershell
build-maven.bat
install-maven.bat
```

### 4. 启动 KookBC

```powershell
cd C:\KookBC
java -jar kookbc-0.33.0.jar
```

## 构建方式

### Gradle

| 脚本 | 说明 |
|------|------|
| `check-env.bat` | 检查 Java 环境 |
| `build.bat` | 编译项目 |
| `install.bat` | 安装到 KookBC |
| `build-and-install.bat` | 一键编译和安装 |

### Maven

| 脚本 | 说明 |
|------|------|
| `build-maven.bat` | 编译项目 |
| `install-maven.bat` | 安装到 KookBC |

## 常见问题

### Q: 首次运行显示"正在下载 Gradle Wrapper"
**A:** 这是正常的，Gradle 会自动下载必要的文件（约 100MB），需要几分钟。

### Q: 编译失败，提示找不到 Java
**A:**
1. 检查是否安装 Java 11 或更高版本
2. 运行 `check-env.bat` 检查环境
3. 设置 JAVA_HOME 环境变量

### Q: 编译失败，提示找不到 JKook API
**A:**
1. 检查网络连接
2. 已配置阿里云镜像加速
3. 如果仍然失败，尝试使用 Maven 编译

### Q: Gradle 下载很慢或失败
**A:**
1. 使用 Maven 方式编译（`build-maven.bat`）
2. 检查网络连接
3. 配置代理（如果有）

### Q: Maven 编译失败
**A:**
1. 检查是否安装 Maven
2. 运行 `mvn -version` 验证
3. 下载 Maven: https://maven.apache.org/download.cgi

### Q: 启动 KookBC 后没有加载插件
**A:**
1. 检查 JAR 文件是否在 `modules` 目录
2. 检查 KookBC 版本是否为 0.33.0 或更高
3. 查看控制台日志，寻找错误信息

## 技术栈

- **Java**: 11+
- **JKook API**: 0.54.2（由 KookBC 提供）
- **KookBC**: 0.33.0
- **OkHttp**: HTTP 客户端
- **Gson**: JSON 处理
- **Gradle**: 8.5（推荐）
- **Maven**: 3.8+（备用）

## 功能计划

- [ ] 基础框架
- [ ] 歌曲解析（网易云、QQ音乐、Bilibili）
- [ ] 队列管理
- [ ] 点歌命令
- [ ] 播放控制
- [ ] 卡片交互

## 相关资源

- JKook API: https://github.com/SNWCreations/JKook
- KookBC: https://github.com/SNWCreations/KookBC
- KOOK 开发者: https://developer.kookapp.cn

## 开发日志

### 2026-04-02
- ✅ 创建干净的项目结构
- ✅ 配置 Gradle 构建
- ✅ 添加 Gradle Wrapper 支持
- ✅ 添加 Maven 备用方案
- ✅ 添加国内镜像加速
- ✅ 创建环境检查脚本
- ✅ 创建 Windows 批处理脚本
- ⏳ 继续开发功能

## 许可证

MIT License
