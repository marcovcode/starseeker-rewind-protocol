// destroy enemies
enemy = instance_place(x, y, o_enemy);
if enemy != noone enemy.has_been_destroyed = true

// destroying spaceship
if place_meeting(x, y, o_spaceship) show_debug_message("game over")