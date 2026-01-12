# Reset timer
scoreboard players set $timer gt_dummy 0

# Pick a random number 1-6
# using execute store in case scoreboard random is not behaving as expected
execute store result score $rnd_dir gt_dummy run random value 1..6

# Play sound for gravity shift
playsound block.conduit.activate master @a ~ ~ ~ 5 0.8
playsound entity.illusioner.cast_spell master @a ~ ~ ~ 1 1

# Apply Gravity and Notify Global
execute if score $rnd_dir gt_dummy matches 1 run gravity set_base_direction up @a
execute if score $rnd_dir gt_dummy matches 1 run tellraw @a [{"text":"Gravity Changed: ","color":"gold"},{"text":"UP","color":"green","bold":true}]

execute if score $rnd_dir gt_dummy matches 2 run gravity set_base_direction down @a
execute if score $rnd_dir gt_dummy matches 2 run tellraw @a [{"text":"Gravity Changed: ","color":"gold"},{"text":"DOWN","color":"green","bold":true}]

execute if score $rnd_dir gt_dummy matches 3 run gravity set_base_direction north @a
execute if score $rnd_dir gt_dummy matches 3 run tellraw @a [{"text":"Gravity Changed: ","color":"gold"},{"text":"NORTH","color":"green","bold":true}]

execute if score $rnd_dir gt_dummy matches 4 run gravity set_base_direction south @a
execute if score $rnd_dir gt_dummy matches 4 run tellraw @a [{"text":"Gravity Changed: ","color":"gold"},{"text":"SOUTH","color":"green","bold":true}]

execute if score $rnd_dir gt_dummy matches 5 run gravity set_base_direction east @a
execute if score $rnd_dir gt_dummy matches 5 run tellraw @a [{"text":"Gravity Changed: ","color":"gold"},{"text":"EAST","color":"green","bold":true}]

execute if score $rnd_dir gt_dummy matches 6 run gravity set_base_direction west @a
execute if score $rnd_dir gt_dummy matches 6 run tellraw @a [{"text":"Gravity Changed: ","color":"gold"},{"text":"WEST","color":"green","bold":true}]
