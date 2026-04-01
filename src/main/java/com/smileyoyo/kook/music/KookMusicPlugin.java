package com.smileyoyo.kook.music;

import snw.jkook.plugin.BasePlugin;
import lombok.extern.slf4j.Slf4j;

/**
 * KOOK 音乐机器人插件
 * 支持网易云、QQ音乐、Bilibili 点歌
 */
@Slf4j
public class KookMusicPlugin extends BasePlugin {

    private static final String VERSION = "1.0.0";
    private static final String NAME = "KOOK 音乐机器人";

    @Override
    public void onEnable() {
        log.info("=======================================");
        log.info("    {} v{}", NAME, VERSION);
        log.info("=======================================");

        // TODO: 注册事件监听器
        // TODO: 注册命令处理器
        // TODO: 初始化队列管理器
        // TODO: 初始化音乐解析器

        log.info("✅ 插件加载成功！");
        log.info("📝 功能开发中...");
    }

    @Override
    public void onDisable() {
        log.info("👋 {} 已关闭", NAME);
    }
}
