# Check against minimum time limit
scoreboard players operation $temp_min gt_dummy = $cfg_min_time gt_dummy
execute if score $limit gt_dummy < $temp_min gt_dummy run scoreboard players operation $limit gt_dummy = $temp_min gt_dummy

# Notify
# We convert ticks to seconds for the message
scoreboard players operation $penalty_seconds gt_dummy = $cfg_penalty gt_dummy
scoreboard players operation $penalty_seconds gt_dummy /= #20 gt_dummy

tellraw @a [{"text":"Death detected! Timer shortened by ","color":"red"},{"score":{"name":"$penalty_seconds","objective":"gt_dummy"},"color":"red"},{"text":"s.","color":"red"}]
