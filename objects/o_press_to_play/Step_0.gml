start_key_pressed = keyboard_check_pressed(ord(" "))

if start_key_pressed and not is_transitioning {
	is_transitioning = true

	transition = instance_create_depth(0, 0, -9999, o_transition)
	transition.target_room = r_game
}