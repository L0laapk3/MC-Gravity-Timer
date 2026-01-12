# Pick random number 1-6
execute store result score $rnd_dir gt_dummy run random value 1..6

# If same as current, retry (recursion)
execute if score $rnd_dir gt_dummy = $current_dir gt_dummy run function gravity_timer:select_valid_direction

# If different, proceed to apply
execute unless score $rnd_dir gt_dummy = $current_dir gt_dummy run function gravity_timer:apply_change
