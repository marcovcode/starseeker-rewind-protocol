// movement
direction = 270

// destruction
destroy_timer = o_rewind.rewind_capacity
has_been_destroyed = false
has_exploded = false

// rewind
steps_data = ds_list_create()
rewind_time = 0

image_index = 1

// difficulty
if image_index = 0 {
	speed = 1

	destruction_score = 1

	min_shooting_time = 0.5
	max_shooting_time = 2
} else if image_index = 1 {
	speed = 1.5

	destruction_score = 2

	min_shooting_time = 0.33
	max_shooting_time = 1.5
}

shooting_timer = random_range(min_shooting_time, max_shooting_time) * game_get_speed(gamespeed_fps)