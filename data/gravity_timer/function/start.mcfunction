# Set game state to ACTIVE (1)
scoreboard players set $state gt_dummy 1

# Show scoreboard
scoreboard objectives setdisplay sidebar gt_sidebar

# Reset limit to Configured Start Time
scoreboard players operation $limit gt_dummy = $cfg_start_time gt_dummy

# Reset timer
scoreboard players set $timer gt_dummy 0

# Reset total deaths
scoreboard players set $total_deaths gt_dummy 0

# Reset player death trackers
scoreboard players set @a gt_deaths 0
scoreboard players set @a gt_detect_death 0

# Set initial direction to DOWN (2) so the first roll is not DOWN
scoreboard players set $current_dir gt_dummy 2

tellraw @a [{"text":"Gravity Timer Scenario Restarted!","color":"green"}]
