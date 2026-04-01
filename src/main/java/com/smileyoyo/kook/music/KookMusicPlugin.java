package com.smileyoyo.kook.music;

import com.smileyoyo.kook.music.listener.CommandListener;
import lombok.extern.slf4j.Slf4j;
import snw.jkook.plugin.BasePlugin;

/**
 * KOOK 音乐机器人插件
 * 支持网易云、QQ音乐、Bilibili 点歌
 */
@Slf4j
public class KookMusicPlugin extends BasePlugin {

    private static final String VERSION = "1.0.0";
    private static final String NAME = "KOOK 音乐机器人";

    private CommandListener commandListener;

    @Override
    public void onEnable() {
        log.info("=======================================");
        log.info("    {} v{}", NAME, VERSION);
        log.info("=======================================");

        try {
            // 初始化命令监听器
            commandListener = new CommandListener(this);
            commandListener.registerCommands();

            log.info("✅ 插件加载成功！");
            log.info("📝 可用命令:");
            log.info("   /wy <歌曲>   - 网易云点歌");
            log.info("   /qq <歌曲>   - QQ音乐点歌");
            log.info("   /bili <视频> - Bilibili点歌");
            log.info("   /queue       - 查看队列");
            log.info("   /skip        - 跳过当前");
            log.info("   /clear       - 清空队列");

        } catch (Exception e) {
            log.error("❌ 插件加载失败", e);
        }
    }

    @Override
    public void onDisable() {
        log.info("👋 {} 已关闭", NAME);
    }

    /**
     * 获取命令监听器
     */
    public CommandListener getCommandListener() {
        return commandListener;
    }
}
