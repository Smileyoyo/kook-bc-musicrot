package com.smileyoyo.kook.music.listener;

import com.smileyoyo.kook.music.KookMusicPlugin;
import com.smileyoyo.kook.music.card.CardGenerator;
import com.smileyoyo.kook.music.manager.QueueManager;
import com.smileyoyo.kook.music.model.Song;
import com.smileyoyo.kook.music.parser.MusicParser;
import lombok.extern.slf4j.Slf4j;
import snw.jkook.Core;
import snw.jkook.command.JKookCommand;
import snw.jkook.entity.Guild;
import snw.jkook.entity.User;
import snw.jkook.entity.channel.TextChannel;
import snw.jkook.message.Message;

/**
 * 命令监听器
 */
@Slf4j
public class CommandListener {

    private final KookMusicPlugin plugin;
    private final MusicParser parser;
    private final QueueManager queueManager;
    private final CardGenerator cardGenerator;

    public CommandListener(KookMusicPlugin plugin) {
        this.plugin = plugin;
        this.parser = new MusicParser();
        this.queueManager = new QueueManager();
        this.cardGenerator = new CardGenerator();
    }

    /**
     * 注册命令
     */
    public void registerCommands() {
        log.info("注册点歌命令...");

        // 网易云点歌
        registerWyCommand();

        // QQ音乐点歌
        registerQQCommand();

        // Bilibili点歌
        registerBiliCommand();

        // 播放控制
        registerControlCommands();

        log.info("命令注册完成");
    }

    /**
     * 注册网易云点歌命令
     */
    private void registerWyCommand() {
        JKookCommand wyCommand = new JKookCommand("wy", "网易云音乐点歌");
        wyCommand.addAlias("网易云", "163");

        wyCommand.addArgument("歌曲名或链接", true);

        wyCommand.setExecutor((sender, args) -> {
            if (!(sender instanceof User)) {
                return;
            }

            String input = args.get(0).toString();

            try {
                Song song = parser.parseNetease(input);

                Guild guild = getCurrentGuild(sender);
                if (guild != null) {
                    queueManager.addSong(guild.getId(), song);

                    sendCard(sender, cardGenerator.generateSongCard(song));

                    if (queueManager.getCurrentSong(guild.getId()) == null) {
                        Song nextSong = queueManager.getNextSong(guild.getId());
                        if (nextSong != null) {
                            sendCard(sender, "开始播放: " + nextSong.getTitle());
                        }
                    }
                }
            } catch (Exception e) {
                log.error("解析网易云歌曲失败", e);
                sendMessage(sender, "❌ 解析失败，请检查输入");
            }
        });

        Core.getInstance().getCommandManager().registerCommand(wyCommand);
    }

    /**
     * 注册QQ音乐点歌命令
     */
    private void registerQQCommand() {
        JKookCommand qqCommand = new JKookCommand("qq", "QQ音乐点歌");
        qqCommand.addAlias("QQ音乐");

        qqCommand.addArgument("歌曲名或链接", true);

        qqCommand.setExecutor((sender, args) -> {
            if (!(sender instanceof User)) {
                return;
            }

            String input = args.get(0).toString();

            try {
                Song song = parser.parseQQ(input);

                Guild guild = getCurrentGuild(sender);
                if (guild != null) {
                    queueManager.addSong(guild.getId(), song);
                    sendCard(sender, cardGenerator.generateSongCard(song));

                    if (queueManager.getCurrentSong(guild.getId()) == null) {
                        Song nextSong = queueManager.getNextSong(guild.getId());
                        if (nextSong != null) {
                            sendCard(sender, "开始播放: " + nextSong.getTitle());
                        }
                    }
                }
            } catch (Exception e) {
                log.error("解析QQ音乐歌曲失败", e);
                sendMessage(sender, "❌ 解析失败，请检查输入");
            }
        });

        Core.getInstance().getCommandManager().registerCommand(qqCommand);
    }

    /**
     * 注册Bilibili点歌命令
     */
    private void registerBiliCommand() {
        JKookCommand biliCommand = new JKookCommand("bili", "Bilibili点歌");
        biliCommand.addAlias("bilibili", "哔哩哔哩");

        biliCommand.addArgument("视频名或链接", true);

        biliCommand.setExecutor((sender, args) -> {
            if (!(sender instanceof User)) {
                return;
            }

            String input = args.get(0).toString();

            try {
                Song song = parser.parseBilibili(input);

                Guild guild = getCurrentGuild(sender);
                if (guild != null) {
                    queueManager.addSong(guild.getId(), song);
                    sendCard(sender, cardGenerator.generateSongCard(song));

                    if (queueManager.getCurrentSong(guild.getId()) == null) {
                        Song nextSong = queueManager.getNextSong(guild.getId());
                        if (nextSong != null) {
                            sendCard(sender, "开始播放: " + nextSong.getTitle());
                        }
                    }
                }
            } catch (Exception e) {
                log.error("解析Bilibili视频失败", e);
                sendMessage(sender, "❌ 解析失败，请检查输入");
            }
        });

        Core.getInstance().getCommandManager().registerCommand(biliCommand);
    }

    /**
     * 注册播放控制命令
     */
    private void registerControlCommands() {
        // 队列
        JKookCommand queueCommand = new JKookCommand("queue", "查看播放队列");
        queueCommand.addAlias("队列", "列表");

        queueCommand.setExecutor((sender, args) -> {
            Guild guild = getCurrentGuild(sender);
            if (guild != null) {
                java.util.List<Song> queue = queueManager.getQueue(guild.getId());
                int position = queueManager.getCurrentSong(guild.getId()) != null ? 1 : 0;
                sendCard(sender, cardGenerator.generateQueueCard(queue, position));
            }
        });

        // 跳过
        JKookCommand skipCommand = new JKookCommand("skip", "跳过当前歌曲");
        skipCommand.addAlias("跳过", "下一首");

        skipCommand.setExecutor((sender, args) -> {
            Guild guild = getCurrentGuild(sender);
            if (guild != null) {
                Song next = queueManager.skipSong(guild.getId());
                if (next != null) {
                    sendMessage(sender, "⏭️ 已跳过，开始播放: " + next.getTitle());
                } else {
                    sendMessage(sender, "⏭️ 队列为空");
                }
            }
        });

        // 清空
        JKookCommand clearCommand = new JKookCommand("clear", "清空播放队列");
        clearCommand.addAlias("清空");

        clearCommand.setExecutor((sender, args) -> {
            Guild guild = getCurrentGuild(sender);
            if (guild != null) {
                queueManager.clearQueue(guild.getId());
                sendMessage(sender, "🗑️ 队列已清空");
            }
        });

        Core.getInstance().getCommandManager().registerCommand(queueCommand);
        Core.getInstance().getCommandManager().registerCommand(skipCommand);
        Core.getInstance().getCommandManager().registerCommand(clearCommand);
    }

    /**
     * 获取当前服务器
     */
    private Guild getCurrentGuild(Object sender) {
        try {
            if (sender instanceof User) {
                // 简化处理，实际需要从上下文获取
                return null;
            }
        } catch (Exception e) {
            log.error("获取服务器失败", e);
        }
        return null;
    }

    /**
     * 发送消息
     */
    private void sendMessage(Object sender, String text) {
        try {
            if (sender instanceof User) {
                // 简化处理
                log.info("发送消息: {}", text);
            }
        } catch (Exception e) {
            log.error("发送消息失败", e);
        }
    }

    /**
     * 发送卡片
     */
    private void sendCard(Object sender, String cardJson) {
        try {
            log.info("发送卡片: {}", cardJson);
            sendMessage(sender, "卡片已发送: " + cardJson);
        } catch (Exception e) {
            log.error("发送卡片失败", e);
        }
    }
}
