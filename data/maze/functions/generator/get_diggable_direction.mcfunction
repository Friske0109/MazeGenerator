#> maze:generator/get_diggable_direction
#
#床の１マス上で実行

#reset
data remove storage maze: dig.DiggableDirections

#設定
$execute if block ~2 ~ ~ $(BaseBlock) run data modify storage maze: dig.DiggableDirections append value ["fill ~1 ~1 ~ ~1 ~$(height) ~ air","scoreboard players add cx MazeGenerator 2"]
$execute if block ~-2 ~ ~ $(BaseBlock) run data modify storage maze: dig.DiggableDirections append value ["fill ~-1 ~1 ~ ~-1 ~$(height) ~ air","scoreboard players remove cx MazeGenerator 2"]
$execute if block ~ ~ ~2 $(BaseBlock) run data modify storage maze: dig.DiggableDirections append value ["fill ~ ~1 ~1 ~ ~$(height) ~1 air","scoreboard players add cz MazeGenerator 2"]
$execute if block ~ ~ ~-2 $(BaseBlock) run data modify storage maze: dig.DiggableDirections append value ["fill ~ ~1 ~-1 ~ ~$(height) ~-1 air","scoreboard players remove cz MazeGenerator 2"]

#採掘可能数を記録
execute store result score DiggableDirectionsCount MazeGenerator run data get storage maze: dig.DiggableDirections
execute store result storage maze: dig.DiggableDirectionsCount int 1 run scoreboard players get DiggableDirectionsCount MazeGenerator