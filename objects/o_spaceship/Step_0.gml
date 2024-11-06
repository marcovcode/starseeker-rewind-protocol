horizontal_keys = keyboard_check(ord("D")) - keyboard_check(ord("A"))
vertical_keys = keyboard_check(ord("S")) - keyboard_check(ord("W"))

// diagonal movement
diagonal_speed_multiplier = 1
is_moving_diagonally = horizontal_keys != 0 and vertical_keys != 0
if is_moving_diagonally diagonal_speed_multiplier = 0.707

speed_x = horizontal_keys * diagonal_speed_multiplier * current_speed
speed_y = vertical_keys * diagonal_speed_multiplier * current_speed

// collisions
if place_meeting(x + speed_x, y, o_collision) speed_x = 0
if place_meeting(x, y + speed_y, o_collision) speed_y = 0

// stopping if rewinding
if o_rewind.is_rewinding {
	speed_x = 0
	speed_y = 0
}

if not has_been_destroyed {
	x += speed_x
	y += speed_y
}

// shooting
shoot_key_pressed = keyboard_check_pressed(ord(" "))

if shoot_key_pressed and not o_rewind.is_rewinding and not has_been_destroyed {
	bullet = instance_create_layer(x, y - sprite_height / 2, "Bullets", o_bullet)
	bullet.direction = 90
	bullet.shooter = o_spaceship
}

// destruction
if has_been_destroyed {
	image_alpha = 0
	
	if not has_exploded {
		has_exploded = true
		explosion = part_system_create(p_explosion)
		part_system_position(explosion, x, y)
	}
}

// rewind
steps_size = ds_list_size(steps_data)

if o_rewind.is_rewinding and steps_size + rewind_time > 0 {
	rewind_time--

	arr = steps_data[|steps_size + rewind_time]
	x = arr[0]
	y = arr[1]
	current_speed = arr[2]
	has_been_destroyed = arr[3]
	has_exploded = arr[4]
	image_alpha = arr[5]
} else if not o_rewind.is_rewinding {
	rewind_time = 0
	ds_list_add(steps_data, [x, y, current_speed, has_been_destroyed, has_exploded, image_alpha]);
}