package com.smileyoyo.kook.music.parser;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.smileyoyo.kook.music.model.Song;
import lombok.extern.slf4j.Slf4j;
import okhttp3.OkHttpClient;
import okhttp3.Request;
import okhttp3.Response;

import java.io.IOException;
import java.util.concurrent.TimeUnit;

/**
 * 音乐解析器
 */
@Slf4j
public class MusicParser {

    private final OkHttpClient client;
    private final Gson gson;

    public MusicParser() {
        this.client = new OkHttpClient.Builder()
                .connectTimeout(10, TimeUnit.SECONDS)
                .readTimeout(10, TimeUnit.SECONDS)
                .build();
        this.gson = new Gson();
    }

    /**
     * 解析网易云歌曲
     */
    public Song parseNetease(String input) throws IOException {
        log.info("解析网易云: {}", input);

        // 简化版：直接返回模拟数据
        // 实际使用时需要调用网易云音乐API
        if (input.contains("music.163.com")) {
            String songId = extractSongId(input, "song\\/(\\d+)");
            return new Song(
                    songId,
                    "示例歌曲",
                    "示例歌手",
                    "示例专辑",
                    "https://via.placeholder.com/300",
                    "https://music.163.com/song/media/outer/url?id=" + songId + ".mp3",
                    "03:45",
                    "netease"
            );
        } else {
            // 搜索歌曲（简化版）
            return new Song(
                    "search_" + System.currentTimeMillis(),
                    input,
                    "搜索结果",
                    "搜索专辑",
                    "https://via.placeholder.com/300",
                    "https://music.163.com/song/media/outer/url?id=12345.mp3",
                    "03:45",
                    "netease"
            );
        }
    }

    /**
     * 解析QQ音乐
     */
    public Song parseQQ(String input) throws IOException {
        log.info("解析QQ音乐: {}", input);

        if (input.contains("y.qq.com")) {
            String songId = extractSongId(input, "songmid\\/(\\w+)");
            return new Song(
                    songId,
                    "示例歌曲",
                    "示例歌手",
                    "示例专辑",
                    "https://via.placeholder.com/300",
                    "https://y.qq.com/n/yqq/song/" + songId + ".html",
                    "04:20",
                    "qq"
            );
        } else {
            return new Song(
                    "search_" + System.currentTimeMillis(),
                    input,
                    "搜索结果",
                    "搜索专辑",
                    "https://via.placeholder.com/300",
                    "https://y.qq.com/n/yqq/song/12345.html",
                    "04:20",
                    "qq"
            );
        }
    }

    /**
     * 解析Bilibili
     */
    public Song parseBilibili(String input) throws IOException {
        log.info("解析Bilibili: {}", input);

        if (input.contains("bilibili.com/video")) {
            String videoId = extractSongId(input, "video\\/(BV\\w+)");
            return new Song(
                    videoId,
                    "示例视频",
                    "示例UP主",
                    "示例合集",
                    "https://via.placeholder.com/300",
                    "https://www.bilibili.com/video/" + videoId,
                    "05:00",
                    "bilibili"
            );
        } else {
            return new Song(
                    "search_" + System.currentTimeMillis(),
                    input,
                    "搜索结果",
                    "搜索合集",
                    "https://via.placeholder.com/300",
                    "https://www.bilibili.com/video/BV1234567890",
                    "05:00",
                    "bilibili"
            );
        }
    }

    /**
     * 提取歌曲ID
     */
    private String extractSongId(String url, String pattern) {
        java.util.regex.Pattern p = java.util.regex.Pattern.compile(pattern);
        java.util.regex.Matcher m = p.matcher(url);
        if (m.find()) {
            return m.group(1);
        }
        return "default";
    }

    /**
     * HTTP GET 请求
     */
    private String get(String url) throws IOException {
        Request request = new Request.Builder()
                .url(url)
                .get()
                .build();

        try (Response response = client.newCall(request).execute()) {
            if (!response.isSuccessful()) {
                throw new IOException("请求失败: " + response.code());
            }
            return response.body() != null ? response.body().string() : "";
        }
    }
}
