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
to_rewind = [x, y, image_alpha, has_been_destroyed]
rewind(to_rewind)

x = to_rewind[0]
y = to_rewind[1]
image_alpha = to_rewind[2]
has_been_destroyed = to_rewind[3]