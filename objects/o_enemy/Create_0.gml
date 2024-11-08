// movement
direction = 270

// destruction
destroy_timer = o_rewind.rewind_capacity
has_been_destroyed = false
has_exploded = false

// rewind
steps_data = ds_list_create()
rewind_time = 0

// difficulty
if image_index = 0 {
	speed = 1

	destruction_score = 1

	min_shooting_time = 1
	max_shooting_time = 1.8
} else if image_index = 1 {
	speed = 1.75

	destruction_score = 3

	min_shooting_time = 0.6
	max_shooting_time = 1.2
} else if image_index = 2 {
	speed = 2.5

	destruction_score = 5

	min_shooting_time = 0.4
	max_shooting_time = 0.8
}

shooting_timer = ((min_shooting_time + max_shooting_time) / 2) * game_get_speed(gamespeed_fps)