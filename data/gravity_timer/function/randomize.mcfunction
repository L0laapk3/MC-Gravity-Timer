# Reset timer
scoreboard players set $timer gt_dummy 0

# Start selection process (Recursive loop to ensure new direction != old direction)
function gravity_timer:select_valid_direction
