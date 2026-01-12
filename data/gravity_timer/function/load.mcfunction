# Create objectives
scoreboard objectives add gt_dummy dummy
scoreboard objectives add gt_deaths deathCount "Deaths"
scoreboard objectives add gt_detect_death deathCount "Death Detection"
scoreboard objectives add gt_sidebar dummy "Gravity Info"

# --- CONFIGURATION (Change these values to customize) ---
# Start Time in ticks (starts at 300s = 6000 ticks)
execute unless score $cfg_start_time gt_dummy matches 1.. run scoreboard players set $cfg_start_time gt_dummy 6000
# Death Penalty in ticks (30s = 600 ticks)
execute unless score $cfg_penalty gt_dummy matches 1.. run scoreboard players set $cfg_penalty gt_dummy 600
# Minimum Time Limit in ticks (10s = 200 ticks)
execute unless score $cfg_min_time gt_dummy matches 1.. run scoreboard players set $cfg_min_time gt_dummy 200
# --------------------------------------------------------

# Initialize variables if they don't exist
# Use the config value for the initial limit if not set
execute unless score $limit gt_dummy matches 1.. run scoreboard players operation $limit gt_dummy = $cfg_start_time gt_dummy

execute unless score $timer gt_dummy matches 0.. run scoreboard players set $timer gt_dummy 0
execute unless score $total_deaths gt_dummy matches 0.. run scoreboard players set $total_deaths gt_dummy 0
execute unless score $state gt_dummy matches 0.. run scoreboard players set $state gt_dummy 0

# Constant for math
scoreboard players set #20 gt_dummy 20

# Setup sidebar
scoreboard objectives setdisplay sidebar gt_sidebar

# Set fixed slots for ordering (Time top, Deaths bottom)
scoreboard players set Time gt_sidebar 2
scoreboard players set Deaths gt_sidebar 1

tellraw @a ["",{"text":"\n================================\n","color":"dark_gray"},{"text":"Gravity Timer Datapack Loaded!\n","color":"gold","bold":true},{"text":"Version: 1.0\n\n","color":"gray"},{"text":"Controls:\n","color":"white"},{"text":"[START GAME]","color":"green","bold":true,"clickEvent":{"action":"run_command","value":"/function gravity_timer:start"},"hoverEvent":{"action":"show_text","value":"Click to START the timer"}},{"text":"  ","color":"white"},{"text":"[STOP GAME]","color":"red","bold":true,"clickEvent":{"action":"run_command","value":"/function gravity_timer:stop"},"hoverEvent":{"action":"show_text","value":"Click to STOP the timer"}},{"text":"\n\n","color":"white"},{"text":"Configuration (Click to edit):\n","color":"white"},{"text":"[Time]","color":"aqua","clickEvent":{"action":"suggest_command","value":"/scoreboard players set $cfg_start_time gt_dummy "},"hoverEvent":{"action":"show_text","value":"Click to set Start Time (in ticks)\nDefault: 6000 (300s)"}},{"text":"  ","color":"white"},{"text":"[Death Penalty]","color":"aqua","clickEvent":{"action":"suggest_command","value":"/scoreboard players set $cfg_penalty gt_dummy "},"hoverEvent":{"action":"show_text","value":"Click to set Penalty (in ticks)\nDefault: 600 (30s)"}},{"text":"\n(1s = 20 ticks)\n","color":"gray","italic":true},{"text":"================================\n","color":"dark_gray"}]
