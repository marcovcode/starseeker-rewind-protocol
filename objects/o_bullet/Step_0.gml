// boundaries
if y < 0 - sprite_height or y > room_height + sprite_height has_been_destroyed = true

// destroying others
if not has_been_destroyed {
	// enemies
	enemy = instance_place(x, y, o_enemy)

	if enemy != noone and not enemy.has_been_destroyed and shooter = o_spaceship {
		has_been_destroyed = true
		enemy.has_been_destroyed = true
		
		score += enemy.destruction_score
	}

	// spaceship
	if place_meeting(x, y, o_spaceship) and not o_spaceship.has_been_destroyed and shooter = o_enemy {
		has_been_destroyed = true
		o_spaceship.has_been_destroyed = true
	}
}

// destroying itself
if has_been_destroyed {
	image_alpha = 0
	
    destroy_timer--
    if destroy_timer <= 0 instance_destroy()
} else {
	image_alpha = 1
}

// rewind
to_rewind = [x, y, has_been_destroyed]

rewind(to_rewind)

x = to_rewind[0]
y = to_rewind[1]
has_been_destroyed = to_rewind[2]