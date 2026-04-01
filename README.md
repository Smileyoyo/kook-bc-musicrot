# KOOK 音乐机器人

基于 JKook API 和 KookBC 的 KOOK 音乐机器人，支持网易云、QQ音乐、Bilibili 点歌。

---

## 目录

- [项目简介](#项目简介)
- [功能特性](#功能特性)
- [环境要求](#环境要求)
- [快速开始](#快速开始)
- [配置说明](#配置说明)
- [使用指南](#使用指南)
- [命令列表](#命令列表)
- [技术架构](#技术架构)
- [开发指南](#开发指南)
- [常见问题](#常见问题)
- [注意事项](#注意事项)

---

## 项目简介

KOOK 音乐机器人是一个功能完整的音乐点歌插件，支持三大主流音乐平台（网易云、QQ音乐、Bilibili），提供队列管理、播放控制、卡片显示等功能。

**GitHub 仓库**: https://github.com/Smileyoyo/kook-bc-musicrot.git

---

## 功能特性

### 核心功能
- ✅ **多平台支持** - 网易云音乐、QQ音乐、Bilibili
- ✅ **智能解析** - 支持歌曲名搜索和链接解析
- ✅ **队列管理** - 自动播放下一首，支持队列操作
- ✅ **播放控制** - 跳过、清空、查看队列
- ✅ **卡片显示** - 美观的卡片界面，包含歌曲信息和操作按钮
- ✅ **服务器隔离** - 每个服务器独立的播放队列

### 技术特性
- ✅ 基于插件架构，易于扩展
- ✅ 异步处理，不阻塞主线程
- ✅ 完善的错误处理和日志记录
- ✅ 支持自定义音乐源

---

## 环境要求

### 必需环境
- **Java**: 11 或更高版本
- **KookBC**: 0.33.0 或更高版本
- **KookBC jar**: 编译时需要

### 推荐环境
- Windows 10/11
- 至少 2GB 可用内存

---

## 快速开始

### 1. 克隆仓库

```powershell
git clone https://github.com/Smileyoyo/kook-bc-musicrot.git
cd kook-bc-musicrot
```

### 2. 编译项目

运行编译脚本：

```powershell
compile.bat
```

**编译脚本会自动**：
- 查找 KookBC jar 文件
- 下载所需依赖
- 编译 Java 源代码
- 创建 JAR 文件
- 复制到 plugins 文件夹

### 3. 启动 KookBC

```powershell
cd [KookBC目录]
java -jar kookbc-0.33.0.jar
```

---

## 配置说明

### KookBC 配置

1. 首次运行 KookBC 会生成 `kbc.yml` 配置文件
2. 编辑 `kbc.yml`，填入你的 KOOK Bot Token
3. 配置 Bot 权限（发送消息、卡片交互等）

### 插件配置

插件无需额外配置，开箱即用。

---

## 使用指南

### 点歌示例

#### 方式 1：歌曲名搜索

```
/wy 告白气球
/qq 孤勇者
/bili 千本樱
```

#### 方式 2：链接点歌

```
/wy https://music.163.com/song?id=12345
/qq https://y.qq.com/song/12345.html
/bili https://www.bilibili.com/video/BV1234567890
```

### 播放控制

```
/queue    # 查看播放队列
/skip     # 跳过当前歌曲
/clear    # 清空播放队列
```

---

## 命令列表

| 命令 | 别名 | 说明 | 示例 |
|------|------|------|------|
| `/wy <歌曲>` | 网易云、163 | 网易云点歌 | `/wy 告白气球` |
| `/qq <歌曲>` | QQ音乐 | QQ音乐点歌 | `/qq 孤勇者` |
| `/bili <视频>` | bilibili、哔哩哔哩 | Bilibili点歌 | `/bili 千本樱` |
| `/queue` | 队列、列表 | 查看播放队列 | `/queue` |
| `/skip` | 跳过、下一首 | 跳过当前歌曲 | `/skip` |
| `/clear` | 清空 | 清空播放队列 | `/clear` |

---

## 技术架构

### 项目结构

```
kook-bc-musicrot/
├── src/main/java/com/smileyoyo/kook/music/
│   ├── KookMusicPlugin.java         # 主插件类
│   ├── model/
│   │   └── Song.java                # 歌曲数据模型
│   ├── manager/
│   │   └── QueueManager.java        # 队列管理器
│   ├── parser/
│   │   └── MusicParser.java         # 音乐解析器
│   ├── card/
│   │   └── CardGenerator.java       # 卡片生成器
│   └── listener/
│       └── CommandListener.java     # 命令监听器
├── src/main/resources/
│   └── plugin.yml                   # 插件清单
├── compile.bat                      # 编译脚本
├── build.gradle.kts                 # Gradle 配置（备用）
└── README.md                        # 说明文档
```

### 技术栈

| 技术 | 版本 | 说明 |
|------|------|------|
| Java | 11+ | 编程语言 |
| JKook API | 0.54.2 | KOOK 机器人框架 |
| KookBC | 0.33.0 | KOOK 客户端 |
| OkHttp | 4.12.0 | HTTP 客户端 |
| Gson | 2.10.1 | JSON 处理 |

### 核心组件

#### 1. KookMusicPlugin
主插件类，负责插件生命周期管理和命令注册。

#### 2. Song
歌曲数据模型，包含歌曲的所有信息。

#### 3. QueueManager
队列管理器，负责歌曲队列的管理和播放控制。

#### 4. MusicParser
音乐解析器，负责解析不同平台的音乐链接和搜索。

#### 5. CardGenerator
卡片生成器，负责生成美观的歌曲和队列卡片。

#### 6. CommandListener
命令监听器，负责处理用户的点歌和控制命令。

---

## 开发指南

### 对接真实音乐API

当前版本使用简化数据，如需对接真实API，请修改 `MusicParser.java`。

---

## 常见问题

### Q1: 编译脚本找不到 KookBC jar？

**A**: 编译脚本会自动查找常见位置的 KookBC jar。如果没有找到，会提示你输入路径。

支持的位置：
- `..\kookbc-0.33.0.jar`
- `E:\后台\后台\kookbot\kookbc-0.33.0.jar`

### Q2: 编译失败，提示找不到 Java？

**A**: 确保已安装 Java 11 或更高版本。

```powershell
java -version
```

### Q3: 编译失败，提示编译错误？

**A**: 检查错误信息，可能是：
1. Java 源代码有语法错误
2. 依赖下载失败

### Q4: 点歌后没有播放？

**A**: 当前版本使用模拟数据，实际播放需要对接真实的音乐API。

### Q5: 如何配置音乐API？

**A**: 修改 `MusicParser.java`，添加真实的API调用。

### Q6: KookBC 启动后没有加载插件？

**A**:
1. 检查 JAR 文件是否在 `plugins` 文件夹
2. 检查 KookBC 版本是否为 0.33.0 或更高
3. 查看 KookBC 控制台日志

### Q7: 如何更新插件？

**A**:
1. 拉取最新代码：`git pull`
2. 重新编译：`compile.bat`
3. 重启 KookBC

---

## 注意事项

### 使用限制

1. **API 调用限制** - 对接真实API时，注意调用频率限制
2. **版权问题** - 使用音乐API时，请遵守相关版权协议
3. **网络要求** - 需要稳定的网络连接访问音乐API

### 性能优化

1. **异步处理** - 所有网络请求使用异步处理
2. **缓存机制** - 可以添加缓存机制，减少重复请求
3. **并发控制** - 合理控制并发请求数量

---

## 开发计划

### 已完成
- [x] 基础框架搭建
- [x] 三大音乐平台支持
- [x] 队列管理系统
- [x] 卡片显示功能
- [x] 播放控制命令
- [x] javac 编译脚本

### 待开发
- [ ] 对接真实音乐API
- [ ] 歌词显示功能
- [ ] 歌单批量导入
- [ ] 搜索功能增强
- [ ] 音频格式转换
- [ ] 音量控制

---

## 许可证

MIT License

---

## 联系方式

- **GitHub**: https://github.com/Smileyoyo/kook-bc-musicrot
- **Issues**: https://github.com/Smileyoyo/kook-bc-musicrot/issues

---

**最后更新**: 2026-04-02
