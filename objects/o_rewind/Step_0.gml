rewind_key = keyboard_check(vk_enter)

if rewind_key {
    current_rewind_capacity = max(0, current_rewind_capacity - 1)

	if current_rewind_capacity > 0 is_rewinding = true
	else is_rewinding = false
} else {
	is_rewinding = false
    current_rewind_capacity = min(rewind_capacity, current_rewind_capacity + 0.05)
}