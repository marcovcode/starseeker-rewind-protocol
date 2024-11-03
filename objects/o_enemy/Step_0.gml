// shooting
if shooting_timer <= 0 {
    show_debug_message("shooting")
    shooting_timer = random_range(min_shooting_time, max_shooting_time) * room_speed
} else {
    shooting_timer -= 1
}

// colliding with spaceship
if place_meeting(x, y, o_spaceship) show_debug_message("game over")

// destruction
if has_been_destroyed instance_destroy()