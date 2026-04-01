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

### 推荐环境
- Windows 10/11
- 至少 2GB 可用内存
- 稳定的网络连接

---

## 快速开始

### 1. 克隆仓库

```powershell
git clone https://github.com/Smileyoyo/kook-bc-musicrot.git
```

### 2. 编译项目

```powershell
cd kook-bc-musicrot
build.bat
```

### 3. 安装插件

```powershell
install.bat
```

JAR 文件会自动复制到 `plugins` 文件夹。

### 4. 启动 KookBC

```powershell
cd [KookBC目录]
java -jar kookbc-0.33.0.jar
```

### 一键操作

也可以直接运行：

```powershell
build-and-install.bat
```

---

## 配置说明

### KookBC 配置

1. 首次运行 KookBC 会生成 `kbc.yml` 配置文件
2. 编辑 `kbc.yml`，填入你的 KOOK Bot Token
3. 配置 Bot 权限（发送消息、卡片交互等）

### 插件配置

插件无需额外配置，开箱即用。

如需自定义音乐源，请参考 [开发指南](#开发指南)。

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

### 卡片操作

点歌后会显示精美的歌曲卡片，包含：
- 歌曲封面
- 歌曲信息（标题、歌手、专辑、时长、来源）
- 交互按钮（播放、跳过）

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
├── build.bat                        # 编译脚本
├── install.bat                      # 安装脚本
├── build-and-install.bat            # 一键脚本
├── build.gradle.kts                 # Gradle 配置
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
| Gradle | 8.5 | 构建工具 |

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

当前版本使用简化数据，如需对接真实API，请修改 `MusicParser.java`：

#### 网易云音乐API

```java
public Song parseNetease(String input) throws IOException {
    // 调用网易云音乐API
    String url = "https://music.163.com/api/song/detail?ids=" + songId;
    String response = get(url);
    // 解析JSON返回Song对象
    return song;
}
```

#### QQ音乐API

```java
public Song parseQQ(String input) throws IOException {
    // 调用QQ音乐API
    String url = "https://c.y.qq.com/v8/fcg-bin/fcg_v8_song_detail.fcg?songmid=" + songId;
    String response = get(url);
    // 解析JSON返回Song对象
    return song;
}
```

#### Bilibili API

```java
public Song parseBilibili(String input) throws IOException {
    // 调用Bilibili API
    String url = "https://api.bilibili.com/x/web-interface/view?bvid=" + bvid;
    String response = get(url);
    // 解析JSON返回Song对象
    return song;
}
```

### 添加新音乐平台

1. 在 `MusicParser` 中添加新的解析方法
2. 在 `CommandListener` 中注册新的命令
3. 在 `CardGenerator` 中更新来源名称映射

### 扩展功能

- 添加歌词显示功能
- 支持歌单批量导入
- 添加音量控制
- 支持播放历史
- 添加用户点歌统计

---

## 常见问题

### Q1: 编译失败，提示找不到 Java？

**A**: 确保已安装 Java 11 或更高版本，并设置 JAVA_HOME 环境变量。

```powershell
java -version
```

### Q2: 编译失败，提示找不到 gradle-wrapper.jar？

**A**: 运行 `gradlew.bat` 下载必要的依赖。

### Q3: 点歌后没有播放？

**A**: 当前版本使用模拟数据，实际播放需要对接真实的音乐API，请参考 [开发指南](#开发指南)。

### Q4: 如何配置音乐API？

**A**: 修改 `MusicParser.java`，添加真实的API调用和Token配置。

### Q5: KookBC 启动后没有加载插件？

**A**:
1. 检查 JAR 文件是否在 `plugins` 文件夹
2. 检查 KookBC 版本是否为 0.33.0 或更高
3. 查看 KookBC 控制台日志，寻找错误信息

### Q6: 命令没有响应？

**A**:
1. 检查 Bot 是否有发送消息权限
2. 检查命令格式是否正确
3. 查看 Bot 日志，寻找错误信息

### Q7: 如何更新插件？

**A**:
1. 拉取最新代码：`git pull`
2. 重新编译：`build.bat`
3. 重新安装：`install.bat`
4. 重启 KookBC

---

## 注意事项

### 使用限制

1. **API 调用限制** - 对接真实API时，注意调用频率限制
2. **版权问题** - 使用音乐API时，请遵守相关版权协议
3. **网络要求** - 需要稳定的网络连接访问音乐API

### 性能优化

1. **异步处理** - 所有网络请求使用异步处理，避免阻塞
2. **缓存机制** - 可以添加缓存机制，减少重复请求
3. **并发控制** - 合理控制并发请求数量

### 安全建议

1. **Token 保护** - 不要在代码中硬编码敏感信息
2. **输入验证** - 对用户输入进行验证，防止注入攻击
3. **错误处理** - 完善的错误处理，避免泄露敏感信息

---

## 开发计划

### 已完成
- [x] 基础框架搭建
- [x] 三大音乐平台支持
- [x] 队列管理系统
- [x] 卡片显示功能
- [x] 播放控制命令

### 待开发
- [ ] 对接真实音乐API
- [ ] 歌词显示功能
- [ ] 歌单批量导入
- [ ] 搜索功能增强
- [ ] 音频格式转换
- [ ] 音量控制
- [ ] 播放历史记录
- [ ] 用户点歌统计
- [ ] 权限管理
- [ ] 自定义命令

---

## 许可证

MIT License

---

## 联系方式

- **GitHub**: https://github.com/Smileyoyo/kook-bc-musicrot
- **Issues**: https://github.com/Smileyoyo/kook-bc-musicrot/issues

---

**最后更新**: 2026-04-02
