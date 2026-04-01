package com.smileyoyo.kook.music.manager;

import com.smileyoyo.kook.music.model.Song;
import lombok.extern.slf4j.Slf4j;

import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

/**
 * 队列管理器
 */
@Slf4j
public class QueueManager {

    // 每个服务器的队列
    private final Map<String, LinkedList<Song>> queues = new ConcurrentHashMap<>();

    // 每个服务器的当前播放歌曲
    private final Map<String, Song> currentPlaying = new ConcurrentHashMap<>();

    /**
     * 添加歌曲到队列
     */
    public void addSong(String serverId, Song song) {
        queues.computeIfAbsent(serverId, k -> new LinkedList<>()).addLast(song);
        log.info("[{}] 添加歌曲到队列: {} - {}", serverId, song.getArtist(), song.getTitle());
    }

    /**
     * 获取下一首歌曲
     */
    public Song getNextSong(String serverId) {
        LinkedList<Song> queue = queues.get(serverId);
        if (queue == null || queue.isEmpty()) {
            return null;
        }
        Song song = queue.removeFirst();
        currentPlaying.put(serverId, song);
        log.info("[{}] 开始播放: {} - {}", serverId, song.getArtist(), song.getTitle());
        return song;
    }

    /**
     * 获取当前播放歌曲
     */
    public Song getCurrentSong(String serverId) {
        return currentPlaying.get(serverId);
    }

    /**
     * 获取队列列表
     */
    public List<Song> getQueue(String serverId) {
        LinkedList<Song> queue = queues.get(serverId);
        return queue != null ? new LinkedList<>(queue) : new LinkedList<>();
    }

    /**
     * 清空队列
     */
    public void clearQueue(String serverId) {
        queues.remove(serverId);
        currentPlaying.remove(serverId);
        log.info("[{}] 队列已清空", serverId);
    }

    /**
     * 跳过当前歌曲
     */
    public Song skipSong(String serverId) {
        return getNextSong(serverId);
    }

    /**
     * 获取队列长度
     */
    public int getQueueSize(String serverId) {
        LinkedList<Song> queue = queues.get(serverId);
        return queue != null ? queue.size() : 0;
    }
}
