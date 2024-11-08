// spawn
min_spawn_time = 1
max_spawn_time = 2

shortest_min_spawn_time = 0.25
shortest_max_spawn_time = 0.75

spawn_timer = random_range(min_spawn_time, max_spawn_time) * game_get_speed(gamespeed_fps)

// score
last_score_checked = score