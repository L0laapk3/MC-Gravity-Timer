# Subtract the penalty
scoreboard players operation $limit gt_dummy -= $cfg_penalty gt_dummy

# Check if we dropped below the minimum floor (which is now 30s)
# If so, clamp it back UP to the minimum.
# (This logic is only reached if we were ABOVE minimum before, so this is safe)
execute if score $limit gt_dummy < $cfg_min_time gt_dummy run scoreboard players operation $limit gt_dummy = $cfg_min_time gt_dummy

# Notify everyone
function gravity_timer:handle_death_notify
