# Cloudflare Railgun Statistics

Script to gather [Cloudflare Railgun statistics](https://www.cloudflare.com/website-optimization/railgun/) outlined in [manual](https://www.cloudflare.com/docs/railgun/administration.html) and send them to a custom Slack channel via incoming webhook.

```
./railgun-stats.sh stats                        
okok
Railgun stats

 wan_stops: 17,
 wan_starts: 23,
 wan_bytes_sent: 89693,
 version: 998119605604704800,
 uncompressed_chunks: 8,
 time: 1539000719,
 requests_started: 8,
 memstats.total_alloc: 2024471808,
 memstats.heap_objects: 44150,
 memstats.heap_in_use: 11370496,
 memstats.heap_idle: 6914048,
 memstats.heap_alloc: 7938048,
 memstats.alloc: 7938048,
 memstats.Mallocs: 5515614,
 memstats.Frees: 5471464,
 delta_compression_ratio: 6,
 memstats.heap_released: 81920,
 memstats.heap_sys: 18284544,
 memstats.lookups: 54434,
 memstats.num_gc: 453,
 memstats.pause_ns: 294808,
 memstats.stack_in_use: 1900544,
 memstats.stack_sys: 1900544,
 memstats.sys: 23849208

Memcached stats
STAT pid 16990
STAT uptime 76977
STAT time 1539000719
STAT version 1.5.10
STAT libevent 2.1.8-stable
STAT pointer_size 64
STAT rusage_user 44.115533
STAT rusage_system 46.703085
STAT max_connections 2048
STAT curr_connections 3
STAT total_connections 3790
STAT rejected_connections 0
STAT connection_structures 5
STAT reserved_fds 20
STAT cmd_get 3606
STAT cmd_set 2783
STAT cmd_flush 0
STAT cmd_touch 2495
STAT get_hits 2505
STAT get_misses 1101
STAT get_expired 4
STAT get_flushed 0
STAT delete_misses 0
STAT delete_hits 0
STAT incr_misses 0
STAT incr_hits 0
STAT decr_misses 0
STAT decr_hits 0
STAT cas_misses 0
STAT cas_hits 0
STAT cas_badval 0
STAT touch_hits 2495
STAT touch_misses 0
STAT auth_cmds 0
STAT auth_errors 0
STAT bytes_read 190701584
STAT bytes_written 128677929
STAT limit_maxbytes 1610612736
STAT accepting_conns 1
STAT listen_disabled_num 0
STAT time_in_listen_disabled_us 0
STAT threads 4
STAT conn_yields 0
STAT hash_power_level 16
STAT hash_bytes 524288
STAT hash_is_expanding 0
STAT slab_reassign_rescues 164
STAT slab_reassign_chunk_rescues 0
STAT slab_reassign_evictions_nomem 0
STAT slab_reassign_inline_reclaim 3
STAT slab_reassign_busy_items 0
STAT slab_reassign_busy_deletes 0
STAT slab_reassign_running 0
STAT slabs_moved 37
STAT lru_crawler_running 0
STAT lru_crawler_starts 14923
STAT lru_maintainer_juggles 2244178
STAT malloc_fails 0
STAT log_worker_dropped 0
STAT log_worker_written 0
STAT log_watcher_skipped 0
STAT log_watcher_sent 0
STAT bytes 1575332
STAT curr_items 27
STAT total_items 2713
STAT slab_global_page_pool 13
STAT expired_unfetched 2124
STAT evicted_unfetched 0
STAT evicted_active 0
STAT evictions 0
STAT reclaimed 2340
STAT crawler_reclaimed 171
STAT crawler_items_checked 27178
STAT lrutail_reflocked 420
STAT moves_to_cold 4486
STAT moves_to_warm 2114
STAT moves_within_lru 267
STAT direct_reclaims 0
STAT lru_bumps_dropped 0
END
```

![](/screenshots/railgun-stats-slack-01.png)