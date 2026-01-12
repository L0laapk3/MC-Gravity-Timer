# Reset detection score ONLY
scoreboard players set @s gt_detect_death 0

# Increment global total
scoreboard players add $total_deaths gt_dummy 1

# Decrease limit by configured penalty
scoreboard players operation $limit gt_dummy -= $cfg_penalty gt_dummy

# Check for loss (Limit <= 0)
execute if score $limit gt_dummy matches ..0 run function gravity_timer:lose

# If not lost, notify and handle clamping
execute if score $limit gt_dummy matches 1.. run function gravity_timer:handle_death_notify
