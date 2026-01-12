# Calculate remaining time for display
scoreboard players operation $remaining gt_dummy = $limit gt_dummy
scoreboard players operation $remaining gt_dummy -= $timer gt_dummy
scoreboard players operation $remaining_seconds gt_dummy = $remaining gt_dummy
scoreboard players add $remaining_seconds gt_dummy 19
scoreboard players operation $remaining_seconds gt_dummy /= #20 gt_dummy

# Update Sidebar Display (Preserving Order)
# Set Time score high so it stays at the top
scoreboard players set Time gt_sidebar 2147483647
# Copy player death counts to sidebar
execute as @a run scoreboard players operation @s gt_sidebar = @s gt_deaths
execute as @a unless score @s gt_sidebar matches 0.. run scoreboard players set @s gt_sidebar 0

# Call display update for the text of Time
execute store result storage gravity:timer time int 1 run scoreboard players get $remaining_seconds gt_dummy
function gravity_timer:update_display with storage gravity:timer

# Stop here if not active (Default state)
execute unless score $state gt_dummy matches 1 run return 0

# Increment timer
scoreboard players add $timer gt_dummy 1

# Check for deaths
# Note: Since we are tracking total deaths on scoreboard, we still need to detect the event of a death to shorten the timer.
# We will check if gt_deaths increased since last tick?
# OR: We use a trigger mechanism.
# For simplicity: Use a separate objective for detection and one for display?
# Current system: gt_deaths is deathCount.
# Change: Create gt_deaths_detect for logic, keep gt_deaths for display.
# Wait, user wants display to increase.
# So we run logic, then clear a "processed" tag? No, deathCount is auto-increment.
# If we don't reset gt_deaths to 0, this logic will run every tick forever for that player.
# FIX: Use a tag to mark as processed, or reset a secondary score.

# Let's pivot: Keep gt_deaths accumulating for display. Use a secondary objective for detection.
# But you can't have two deathCount objectives? Yes you can.
execute as @a[scores={gt_detect_death=1..}] run function gravity_timer:handle_death

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
