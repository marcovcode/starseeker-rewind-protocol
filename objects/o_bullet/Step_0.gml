// destroying enemies
enemy = instance_place(x, y, o_enemy)

if enemy != noone and not enemy.has_been_destroyed and shooter = o_spaceship and not has_been_destroyed {
	has_been_destroyed = true
	enemy.has_been_destroyed = true
	image_alpha = 0
}

// destroying spaceship
spaceship = instance_place(x, y, o_spaceship)

if spaceship != noone and not spaceship.has_been_destroyed and shooter = o_enemy and not has_been_destroyed {
	has_been_destroyed = true
	image_alpha = 0
	o_spaceship.has_been_destroyed = true
}

// destroying when out of boundaries
if y < 0 - sprite_height or y > room_height + sprite_height instance_destroy()

// rewind
steps_size = ds_list_size(steps_data)

if o_rewind.is_rewinding and steps_size + rewind_time > 0 {
	rewind_time--

	arr = steps_data[|steps_size + rewind_time]
	x = arr[0]
	y = arr[1]
	image_alpha = arr[2]
	has_been_destroyed = arr[3]
} else if not o_rewind.is_rewinding {
	rewind_time = 0
	ds_list_add(steps_data, [x, y, image_alpha, has_been_destroyed]);
}