# Check for standard cardinal directions (using Gravity vector NBT)

# DOWN
execute if data entity @s {Gravity:[0.0d,-1.0d,0.0d]} run tellraw @s [{"text":"Gravity Randomized: ","color":"gold"},{"text":"DOWN","color":"aqua","bold":true}]

# UP
execute if data entity @s {Gravity:[0.0d,1.0d,0.0d]} run tellraw @s [{"text":"Gravity Randomized: ","color":"gold"},{"text":"UP","color":"aqua","bold":true}]

# NORTH
execute if data entity @s {Gravity:[0.0d,0.0d,-1.0d]} run tellraw @s [{"text":"Gravity Randomized: ","color":"gold"},{"text":"NORTH","color":"aqua","bold":true}]

# SOUTH
execute if data entity @s {Gravity:[0.0d,0.0d,1.0d]} run tellraw @s [{"text":"Gravity Randomized: ","color":"gold"},{"text":"SOUTH","color":"aqua","bold":true}]

# WEST
execute if data entity @s {Gravity:[-1.0d,0.0d,0.0d]} run tellraw @s [{"text":"Gravity Randomized: ","color":"gold"},{"text":"WEST","color":"aqua","bold":true}]

# EAST
execute if data entity @s {Gravity:[1.0d,0.0d,0.0d]} run tellraw @s [{"text":"Gravity Randomized: ","color":"gold"},{"text":"EAST","color":"aqua","bold":true}]

# Fallback (if NBT doesn't match standard cardinal vectors or mod uses different format)
execute unless data entity @s {Gravity:[0.0d,-1.0d,0.0d]} unless data entity @s {Gravity:[0.0d,1.0d,0.0d]} unless data entity @s {Gravity:[0.0d,0.0d,-1.0d]} unless data entity @s {Gravity:[0.0d,0.0d,1.0d]} unless data entity @s {Gravity:[-1.0d,0.0d,0.0d]} unless data entity @s {Gravity:[1.0d,0.0d,0.0d]} run tellraw @s [{"text":"Gravity Randomized!","color":"gold"}]
