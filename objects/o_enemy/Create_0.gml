// movement
speed = 1
direction = 270

// shooting
min_shooting_time = 0.5
max_shooting_time = 2
shooting_timer = random_range(min_shooting_time, max_shooting_time) * game_get_speed(gamespeed_fps)

// destruction
destroy_timer = o_rewind.rewind_capacity
has_been_destroyed = false
has_exploded = false

// rewind
steps_data = ds_list_create()
rewind_time = 0