# Reset detection score ONLY
scoreboard players set @s gt_detect_death 0

# Increment global total
scoreboard players add $total_deaths gt_dummy 1

# Only apply penalty if the current limit is ABOVE the minimum floor
execute if score $limit gt_dummy > $cfg_min_time gt_dummy run function gravity_timer:apply_penalty

# Check for loss (Limit <= 0) - This is technically reachable if min_time is set to 0, or if logic changes.
execute if score $limit gt_dummy matches ..0 run function gravity_timer:lose
