horizontal_keys = keyboard_check(ord("D")) - keyboard_check(ord("A"))
vertical_keys = keyboard_check(ord("S")) - keyboard_check(ord("W"))

// diagonal movement
diagonal_speed_multiplier = 1
is_moving_diagonally = horizontal_keys != 0 and vertical_keys != 0
if is_moving_diagonally diagonal_speed_multiplier = 0.707

speed_x = horizontal_keys * diagonal_speed_multiplier * current_speed
speed_y = vertical_keys * diagonal_speed_multiplier * current_speed

// collisions
if place_meeting(x + speed_x, y, o_collision) speed_x = 0
if place_meeting(x, y + speed_y, o_collision) speed_y = 0

x += speed_x
y += speed_y