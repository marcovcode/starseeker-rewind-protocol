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
to_rewind = [x, y, image_alpha, has_been_destroyed, has_exploded]
rewind(to_rewind)

x = to_rewind[0]
y = to_rewind[1]
image_alpha = to_rewind[2]
has_been_destroyed = to_rewind[3]
has_exploded = to_rewind[4]