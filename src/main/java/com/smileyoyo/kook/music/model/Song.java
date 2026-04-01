package com.smileyoyo.kook.music.model;

import lombok.Data;

/**
 * 歌曲信息
 */
@Data
public class Song {
    private String id;
    private String title;
    private String artist;
    private String album;
    private String cover;
    private String url;
    private String duration;
    private String source; // netease, qq, bilibili

    public Song(String id, String title, String artist, String album, String cover, String url, String duration, String source) {
        this.id = id;
        this.title = title;
        this.artist = artist;
        this.album = album;
        this.cover = cover;
        this.url = url;
        this.duration = duration;
        this.source = source;
    }
}
