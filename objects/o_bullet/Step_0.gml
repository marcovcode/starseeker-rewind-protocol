// destroying enemies
enemy = instance_place(x, y, o_enemy);
if enemy != noone {
	enemy.has_been_destroyed = true
	instance_destroy()
}

// destroying spaceship
if place_meeting(x, y, o_spaceship) {
	show_debug_message("game over")
	instance_destroy()
}

// destroying self
if y < 0 - sprite_height or y > room_height + sprite_height instance_destroy()