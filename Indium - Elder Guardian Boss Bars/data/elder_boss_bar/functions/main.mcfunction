bossbar set minecraft:elder_bar players
bossbar set minecraft:elder_bar players @a[tag=in_range_of_elder]
execute if entity @e[tag=current_guardian] run bossbar set minecraft:elder_bar visible true
execute unless entity @e[tag=current_guardian,limit=1] run bossbar set minecraft:elder_bar visible false

execute store result bossbar minecraft:elder_bar value run data get entity @e[tag=current_guardian,limit=1] Health

execute as @a at @s if entity @e[type=minecraft:elder_guardian,distance=..15] run tag @s add in_range_of_elder
execute as @e[type=minecraft:elder_guardian] at @s if entity @a[tag=in_range_of_elder,distance=..15] run tag @s add current_guardian

execute as @a[tag=in_range_of_elder] at @s unless entity @e[type=minecraft:elder_guardian,distance=..15] run tag @s remove in_range_of_elder
execute as @e[type=minecraft:elder_guardian] at @s unless entity @a[tag=in_range_of_elder,distance=..15] run tag @s remove current_guardian
