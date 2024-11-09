pause_key_pressed = keyboard_check_pressed(vk_escape)

if pause_key_pressed {
	is_paused = not is_paused
	
	if is_paused {
		instance_deactivate_all(true)
	} else {
		instance_activate_all()
	}
}