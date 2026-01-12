# Reset timer
scoreboard players set $timer gt_dummy 0

# Randomize gravity for everyone
execute as @a run gravity randomize_base_direction

# Notify each player of their new direction
execute as @a run function gravity_timer:notify_direction
