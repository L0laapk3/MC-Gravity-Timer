# Show title
title @a title {"text":"YOU LOSE!","color":"red","bold":true}
title @a subtitle {"text":"Time limit reached 0!","color":"yellow"}

# Play sound
playsound entity.ender_dragon.growl master @a ~ ~ ~ 1 1

# Set state to INACTIVE (0)
scoreboard players set $state gt_dummy 0
