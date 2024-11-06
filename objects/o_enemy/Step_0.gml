// shooting
if shooting_timer <= 0 and not has_been_destroyed {
    bullet = instance_create_layer(x, y + sprite_height / 2, "Bullets", o_bullet)
	bullet.direction = 270
	bullet.shooter = o_enemy
	
    shooting_timer = random_range(min_shooting_time, max_shooting_time) * room_speed
} else {
    shooting_timer -= 1
}

// colliding with spaceship
if place_meeting(x, y, o_spaceship) and not has_been_destroyed o_spaceship.has_been_destroyed = true

// destruction
if has_been_destroyed {
	image_alpha = 0

	if not has_exploded {
		has_exploded = true
		explosion = part_system_create(p_explosion)
		part_system_position(explosion, x, y)
	}
}

// destroying when out of boundaries
if y > room_height + sprite_height instance_destroy()

// rewind
steps_size = ds_list_size(steps_data)

if o_rewind.is_rewinding and steps_size + rewind_time > 0 {
	rewind_time--

	arr = steps_data[|steps_size + rewind_time]
	x = arr[0]
	y = arr[1]
	has_been_destroyed = arr[2]
	has_exploded = arr[3]
	image_alpha = arr[4]
} else if not o_rewind.is_rewinding {
	rewind_time = 0
	ds_list_add(steps_data, [x, y, has_been_destroyed, has_exploded, image_alpha]);
}