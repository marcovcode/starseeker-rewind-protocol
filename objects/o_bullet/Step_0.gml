// destroying enemies
if place_meeting(x, y, o_enemy) show_debug_message("enemy destroyed")

// destroying spaceship
if place_meeting(x, y, o_spaceship) show_debug_message("game over")