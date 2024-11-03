// shooting
if shooting_timer <= 0 {
    bullet = instance_create_layer(x, y + sprite_height / 2, "Bullets", o_bullet)
	bullet.direction = 270
    shooting_timer = random_range(min_shooting_time, max_shooting_time) * room_speed
} else {
    shooting_timer -= 1
}

// colliding with spaceship
if place_meeting(x, y, o_spaceship) show_debug_message("game over")

// destruction
if has_been_destroyed {
	explosion = part_system_create(p_explosion)
	part_system_position(explosion, x, y)
	instance_destroy()
}