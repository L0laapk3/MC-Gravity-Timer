# Calculate remaining time for display
scoreboard players operation $remaining gt_dummy = $limit gt_dummy
scoreboard players operation $remaining gt_dummy -= $timer gt_dummy
scoreboard players operation $remaining_seconds gt_dummy = $remaining gt_dummy
scoreboard players add $remaining_seconds gt_dummy 19
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
# Play every 20 ticks (1 second)
scoreboard players operation $diff gt_dummy = $limit gt_dummy
scoreboard players operation $diff gt_dummy -= $timer gt_dummy

# Reuse $remaining as temp variable for modulo
# We use a temp op so we don't mess up other logic if any
scoreboard players operation $tick_sound gt_dummy = $diff gt_dummy
scoreboard players operation $tick_sound gt_dummy %= #20 gt_dummy

execute if score $diff gt_dummy matches 1..100 if score $tick_sound gt_dummy matches 0 at @a run playsound block.note_block.hat master @p ~ ~ ~ 1 2

# Visual Countdown
execute if score $diff gt_dummy matches 100 run title @a times 0 25 5
execute if score $diff gt_dummy matches 100 run title @a title {"text":"5","color":"red","bold":true}
execute if score $diff gt_dummy matches 80 run title @a title {"text":"4","color":"red","bold":true}
execute if score $diff gt_dummy matches 60 run title @a title {"text":"3","color":"red","bold":true}
execute if score $diff gt_dummy matches 40 run title @a title {"text":"2","color":"red","bold":true}
execute if score $diff gt_dummy matches 20 run title @a title {"text":"1","color":"dark_red","bold":true}

# Check if timer finished
execute if score $timer gt_dummy >= $limit gt_dummy run function gravity_timer:randomize
