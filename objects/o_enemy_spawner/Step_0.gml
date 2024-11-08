if score % 5 = 0 and score != 0 and score != last_score_checked {
    // changing difficulty
    min_spawn_time = max(shortest_min_spawn_time, min_spawn_time - 0.2)
    max_spawn_time = max(shortest_max_spawn_time, max_spawn_time - 0.2)
    last_score_checked = score
}

if not o_rewind.is_rewinding {
    // spawning
    if spawn_timer <= 0 {
        enemy = instance_create_layer(0, -10, "Enemies", o_enemy)
        enemy.x = random_range(enemy.sprite_width / 2, room_width - enemy.sprite_width / 2)
        spawn_timer = random_range(min_spawn_time, max_spawn_time) * game_get_speed(gamespeed_fps)

        // difficulty
        if score >= 30 {
			random_value = irandom(3)

            if random_value = 0 or random_value = 1 {
				enemy.image_index = 1
			} else if random_value = 2 {
				enemy.image_index = 2
			}
        } else if score >= 15 {
            if irandom(3) = 0 enemy.image_index = 1
        }
    } else {
        spawn_timer -= 1
    }
}