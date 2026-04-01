# KOOK Music Bot

基于 JKook API 和 KookBC 的 KOOK 音乐机器人。

## 功能特性

- ✅ 网易云音乐点歌
- ✅ QQ音乐点歌
- ✅ Bilibili 视频点歌
- ✅ 播放队列管理
- ✅ 播放控制（跳过、清空）
- ✅ 卡片显示

## 快速开始

### 编译安装

```powershell
build-and-install.bat
```

JAR 文件会自动复制到 `plugins` 文件夹。

### 启动 KookBC

```powershell
java -jar kookbc-0.33.0.jar
```

## 命令列表

| 命令 | 别名 | 说明 |
|------|------|------|
| `/wy <歌曲>` | 网易云、163 | 网易云点歌 |
| `/qq <歌曲>` | QQ音乐 | QQ音乐点歌 |
| `/bili <视频>` | bilibili、哔哩哔哩 | Bilibili点歌 |
| `/queue` | 队列、列表 | 查看播放队列 |
| `/skip` | 跳过、下一首 | 跳过当前歌曲 |
| `/clear` | 清空 | 清空播放队列 |

## 使用示例

### 点歌

```
/wy 告白气球
/qq 孤勇者
/bili 千本樱
```

### 链接点歌

```
/wy https://music.163.com/song?id=12345
/qq https://y.qq.com/song/12345.html
/bili https://www.bilibili.com/video/BV1234567890
```

### 播放控制

```
/queue    # 查看队列
/skip     # 跳过当前
/clear    # 清空队列
```

## 技术栈

- Java 11+
- JKook API 0.54.2
- KookBC 0.33.0
- OkHttp 4.12.0
- Gson 2.10.1
- Gradle 8.5

## 项目结构

```
kook-music-bot/
├── src/main/java/com/smileyoyo/kook/music/
│   ├── KookMusicPlugin.java    # 主插件类
│   ├── model/
│   │   └── Song.java          # 歌曲模型
│   ├── manager/
│   │   └── QueueManager.java  # 队列管理器
│   ├── parser/
│   │   └── MusicParser.java   # 音乐解析器
│   ├── card/
│   │   └── CardGenerator.java # 卡片生成器
│   └── listener/
│       └── CommandListener.java # 命令监听器
└── src/main/resources/
    └── plugin.yml            # 插件清单
```

## 功能说明

### 歌曲解析

支持三种音乐平台的歌曲解析：
- 网易云音乐
- QQ音乐
- Bilibili

可以通过歌曲名搜索或直接使用链接。

### 队列管理

- 每个服务器独立队列
- 自动播放下一首
- 实时显示播放列表

### 卡片显示

- 美观的卡片界面
- 显示歌曲信息
- 交互式按钮

## 注意事项

1. 本版本为简化版，音乐解析功能使用模拟数据
2. 实际使用需要对接真实的音乐API
3. 需要配置音乐API的Token或密钥

## 开发计划

- [ ] 对接真实音乐API
- [ ] 添加歌词显示
- [ ] 支持歌单导入
- [ ] 添加搜索功能
- [ ] 支持音频格式转换
- [ ] 添加音量控制

## 常见问题

### Q: 点歌后没有播放？
A: 当前版本使用模拟数据，实际播放需要对接真实的音乐API。

### Q: 如何配置音乐API？
A: 需要修改 `MusicParser.java`，添加真实的API调用。

### Q: 支持哪些格式？
A: 支持网易云、QQ音乐、Bilibili的链接格式。

## 许可证

MIT License
