# Increment timer
scoreboard players add $timer gt_dummy 1

# Check for deaths
execute as @a[scores={gt_deaths=1..}] run function gravity_timer:handle_death

# Calculate remaining time for display
scoreboard players operation $remaining gt_dummy = $limit gt_dummy
scoreboard players operation $remaining gt_dummy -= $timer gt_dummy
scoreboard players operation $remaining_seconds gt_dummy = $remaining gt_dummy
scoreboard players operation $remaining_seconds gt_dummy /= #20 gt_dummy

# Update Sidebar Display (Preserving Order)
execute store result storage gravity:timer time int 1 run scoreboard players get $remaining_seconds gt_dummy
execute store result storage gravity:timer deaths int 1 run scoreboard players get $total_deaths gt_dummy
function gravity_timer:update_display with storage gravity:timer

# Stop here if not active (Default state)
execute unless score $state gt_dummy matches 1 run return 0

# Increment timer
scoreboard players add $timer gt_dummy 1

# Check for deaths
execute as @a[scores={gt_deaths=1..}] run function gravity_timer:handle_death

# Check state again (in case death caused immediate loss/stop)
execute unless score $state gt_dummy matches 1 run return 0

# Ticking sound for last 5 seconds (100 ticks) when timer is close to limit
# limit - timer <= 100
scoreboard players operation $diff gt_dummy = $limit gt_dummy
scoreboard players operation $diff gt_dummy -= $timer gt_dummy
execute if score $diff gt_dummy matches 1..100 if score $timer gt_dummy matches 1.. run playsound block.note_block.hat master @a ~ ~ ~ 0.5 2

# Check if timer finished
execute if score $timer gt_dummy >= $limit gt_dummy run function gravity_timer:randomize
execute if score $timer gt_dummy >= $limit gt_dummy run function gravity_timer:randomize
