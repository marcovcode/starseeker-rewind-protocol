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
                enemy.image_index = 1
            } else {
                enemy.image_index = 2
            }
        } else if score >= 40 {
            random_value = irandom(4)
            if random_value <= 2 { 
                enemy.image_index = 1
            }
        }

        min_spawn_time = max(0.5, min_spawn_time - 0.05 * (score / 40))
        max_spawn_time = max(1.0, max_spawn_time - 0.1 * (score / 40))
    } else {
        spawn_timer -= 1
    }
}