// shooting
if shooting_timer <= 0 and not has_been_destroyed {
    bullet = instance_create_layer(x, y + sprite_height / 2, "Bullets", o_bullet)
	bullet.direction = 270
	bullet.shooter = o_enemy

    shooting_timer = random_range(min_shooting_time, max_shooting_time) * game_get_speed(gamespeed_fps)
} else {
    shooting_timer--
}

// boundaries
if y > room_height + sprite_height has_been_destroyed = true

// destroying spaceship
if place_meeting(x, y, o_spaceship) and not has_been_destroyed o_spaceship.has_been_destroyed = true

// destroying itself
if has_been_destroyed {
	image_alpha = 0

	if not has_exploded {
		has_exploded = true
		
		if not o_rewind.is_rewinding {
			explosion = part_system_create(p_explosion)
			part_system_position(explosion, x, y)
		}
	}

    destroy_timer--
    if destroy_timer <= 0 instance_destroy()
} else {
	image_alpha = 1
}

// rewind
to_rewind = [x, y, has_been_destroyed, has_exploded]

rewind(to_rewind)

x = to_rewind[0]
y = to_rewind[1]
has_been_destroyed = to_rewind[2]
has_exploded = to_rewind[3]