if spawn_timer <= 0 {
    enemy = instance_create_layer(0, -10, "Enemies", o_enemy)
	enemy.x = random_range(enemy.sprite_width / 2, room_width - enemy.sprite_width / 2)
    spawn_timer = random_range(min_spawn_time, max_spawn_time) * room_speed
} else {
    spawn_timer -= 1;
}