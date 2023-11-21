#> maze:init

scoreboard objectives add MazeGenerator dummy
scoreboard players reset * MazeGenerator

tellraw @a "MazeGenerator is loaded."