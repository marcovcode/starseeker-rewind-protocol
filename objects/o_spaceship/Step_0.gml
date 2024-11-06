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
to_rewind = [x, y, image_alpha, has_been_destroyed, has_exploded]
rewind(to_rewind)

x = to_rewind[0]
y = to_rewind[1]
image_alpha = to_rewind[2]
has_been_destroyed = to_rewind[3]
has_exploded = to_rewind[4]