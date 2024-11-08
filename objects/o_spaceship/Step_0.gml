speed_x = (keyboard_check(ord("D")) - keyboard_check(ord("A"))) * _speed
speed_y = (keyboard_check(ord("S")) - keyboard_check(ord("W"))) * _speed

// collisions
if place_meeting(x + speed_x, y, o_collision) speed_x = 0
if place_meeting(x, y + speed_y, o_collision) speed_y = 0

//sStopping if rewinding
if o_rewind.is_rewinding {
    speed_x = 0
    speed_y = 0
}

if not has_been_destroyed {
    x += speed_x
    y += speed_y
}

// shooting
shoot_cooldown += 1 / game_get_speed(gamespeed_fps)
shoot_key_pressed = keyboard_check_pressed(ord(" "))

if shoot_key_pressed and shoot_cooldown >= shoot_cooldown_time and not o_rewind.is_rewinding and not has_been_destroyed {
    shoot_cooldown = 0

    bullet = instance_create_layer(x, y - sprite_height / 2, "Bullets", o_bullet)
    bullet.direction = 90
    bullet.shooter = o_spaceship
}

// destroying itself
if has_been_destroyed {
    image_alpha = 0

    if not has_exploded {
        has_exploded = true

        if not o_rewind.is_rewinding {
            explosion = part_system_create(p_explosion)
            part_system_position(explosion, x, y)
        }
    }

    destroy_timer--
    if destroy_timer <= 0 instance_destroy()
} else {
    image_alpha = 1
}

// rewind functionality
to_rewind = [x, y, has_been_destroyed, has_exploded]

rewind(to_rewind)

x = to_rewind[0]
y = to_rewind[1]
has_been_destroyed = to_rewind[2]
has_exploded = to_rewind[3]