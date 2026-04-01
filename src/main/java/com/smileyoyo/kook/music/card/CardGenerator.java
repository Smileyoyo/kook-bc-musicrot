package com.smileyoyo.kook.music.card;

import com.google.gson.Gson;
import com.smileyoyo.kook.music.model.Song;
import lombok.extern.slf4j.Slf4j;

/**
 * 卡片生成器
 */
@Slf4j
public class CardGenerator {

    private final Gson gson;

    public CardGenerator() {
        this.gson = new Gson();
    }

    /**
     * 生成歌曲卡片
     */
    public String generateSongCard(Song song) {
        JsonObject card = new JsonObject();

        // 卡片类型
        card.addProperty("type", "card");

        // 主题颜色
        JsonObject theme = new JsonObject();
        theme.addProperty("color", "default");
        card.add("theme", theme);

        // 模块列表
        java.util.List<JsonObject> modules = new java.util.ArrayList<>();

        // 标题模块
        JsonObject header = new JsonObject();
        header.addProperty("type", "header");
        JsonObject headerText = new JsonObject();
        headerText.addProperty("type", "plain-text");
        headerText.addProperty("content", "🎵 " + song.getTitle());
        header.add("text", headerText);
        modules.add(header);

        // 内容模块
        JsonObject section = new JsonObject();
        section.addProperty("type", "section");
        JsonObject sectionText = new JsonObject();
        sectionText.addProperty("type", "kmarkdown");
        sectionText.addProperty("content", String.format(
                "**歌手:** %s\n**专辑:** %s\n**来源:** %s\n**时长:** %s",
                song.getArtist(),
                song.getAlbum(),
                getSourceName(song.getSource()),
                song.getDuration()
        ));
        section.add("text", sectionText);
        modules.add(section);

        // 图片模块
        if (song.getCover() != null) {
            JsonObject image = new JsonObject();
            image.addProperty("type", "image");
            JsonObject imageElement = new JsonObject();
            imageElement.addProperty("type", "image");
            imageElement.addProperty("src", song.getCover());
            image.add("elements", new java.util.ArrayList<>() {{
                add(imageElement);
            }});
            modules.add(image);
        }

        // 按钮模块
        JsonObject actionGroup = new JsonObject();
        actionGroup.addProperty("type", "action-group");
        java.util.List<JsonObject> elements = new java.util.ArrayList<>();

        // 播放按钮
        JsonObject playButton = new JsonObject();
        playButton.addProperty("type", "button");
        playButton.addProperty("theme", "primary");
        playButton.addProperty("value", "play:" + song.getId());
        JsonObject playText = new JsonObject();
        playText.addProperty("type", "plain-text");
        playText.addProperty("content", "▶️ 播放");
        playButton.add("text", playText);
        elements.add(playButton);

        // 跳过按钮
        JsonObject skipButton = new JsonObject();
        skipButton.addProperty("type", "button");
        skipButton.addProperty("theme", "default");
        skipButton.addProperty("value", "skip");
        JsonObject skipText = new JsonObject();
        skipText.addProperty("type", "plain-text");
        skipText.addProperty("content", "⏭️ 跳过");
        skipButton.add("text", skipText);
        elements.add(skipButton);

        actionGroup.add("elements", gson.toJsonTree(elements));
        modules.add(actionGroup);

        card.add("modules", gson.toJsonTree(modules));

        return gson.toJson(card);
    }

    /**
     * 生成队列卡片
     */
    public String generateQueueCard(java.util.List<com.smileyoyo.kook.music.model.Song> queue, int position) {
        JsonObject card = new JsonObject();

        card.addProperty("type", "card");

        JsonObject theme = new JsonObject();
        theme.addProperty("color", "default");
        card.add("theme", theme);

        java.util.List<JsonObject> modules = new java.util.ArrayList<>();

        // 标题
        JsonObject header = new JsonObject();
        header.addProperty("type", "header");
        JsonObject headerText = new JsonObject();
        headerText.addProperty("type", "plain-text");
        headerText.addProperty("content", "📋 播放队列");
        header.add("text", headerText);
        modules.add(header);

        // 内容
        if (queue.isEmpty()) {
            JsonObject section = new JsonObject();
            section.addProperty("type", "section");
            JsonObject sectionText = new JsonObject();
            sectionText.addProperty("type", "plain-text");
            sectionText.addProperty("content", "队列为空，快来点歌吧！");
            section.add("text", sectionText);
            modules.add(section);
        } else {
            StringBuilder sb = new StringBuilder();
            sb.append("**当前播放:** 第 ").append(position).append(" 首\n\n");
            sb.append("**播放列表:**\n");

            for (int i = 0; i < Math.min(queue.size(), 10); i++) {
                Song song = queue.get(i);
                sb.append(String.format("%d. %s - %s\n", i + 1, song.getArtist(), song.getTitle()));
            }

            if (queue.size() > 10) {
                sb.append(String.format("... 还有 %d 首歌曲", queue.size() - 10));
            }

            JsonObject section = new JsonObject();
            section.addProperty("type", "section");
            JsonObject sectionText = new JsonObject();
            sectionText.addProperty("type", "kmarkdown");
            sectionText.addProperty("content", sb.toString());
            section.add("text", sectionText);
            modules.add(section);
        }

        card.add("modules", gson.toJsonTree(modules));

        return gson.toJson(card);
    }

    /**
     * 获取来源名称
     */
    private String getSourceName(String source) {
        switch (source) {
            case "netease":
                return "网易云音乐";
            case "qq":
                return "QQ音乐";
            case "bilibili":
                return "Bilibili";
            default:
                return "未知";
        }
    }
}
