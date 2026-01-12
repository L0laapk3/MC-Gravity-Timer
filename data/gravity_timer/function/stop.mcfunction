# Set state to INACTIVE (0)
scoreboard players set $state gt_dummy 0

# Hide scoreboard
scoreboard objectives setdisplay sidebar

tellraw @a [{"text":"Gravity Timer Stopped!","color":"red"}]
