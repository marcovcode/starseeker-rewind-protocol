if not o_rewind.is_rewinding {
    // spawning
    if spawn_timer <= 0 {
        enemy = instance_create_layer(0, -10, "Enemies", o_enemy)
        enemy.x = random_range(enemy.sprite_width / 2, room_width - enemy.sprite_width / 2)
        spawn_timer = random_range(min_spawn_time, max_spawn_time) * game_get_speed(gamespeed_fps)

        // difficulty
        if score >= 80 {
            random_value = irandom(4)
            if random_value <= 1 { 
                enemy.image_index = 2
            } else if random_value <= 2 {
                enemy.image_index = 1
            }
        } else if score >= 40 {
            random_value = irandom(4)
            if random_value <= 2 { 
                enemy.image_index = 1
            }
        }

        if enemy.image_index = 0 {
            enemy.speed = 1
            enemy.destruction_score = 1
            enemy.min_shooting_time = 1
            enemy.max_shooting_time = 1.8
        } else if enemy.image_index = 1 {
            enemy.speed = 1.25
            enemy.destruction_score = 3
            enemy.min_shooting_time = 0.6
            enemy.max_shooting_time = 1.2
        } else if enemy.image_index== 2 {
            enemy.speed = 1.5
            enemy.destruction_score = 5
            enemy.min_shooting_time = 0.4
            enemy.max_shooting_time = 0.8
        }
		
        enemy.shooting_timer = ((enemy.min_shooting_time + enemy.max_shooting_time) / 2) * game_get_speed(gamespeed_fps)

        // spawn timer
        min_spawn_time = max(0.5, shortest_min_spawn_time - 0.05 * (score / 40))
        max_spawn_time = max(1.0, shortest_max_spawn_time - 0.1 * (score / 40))
    } else {
        spawn_timer -= 1
    }
}
