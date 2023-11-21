#> maze:generator/random_move

$execute store result score mx MazeGenerator run $(RandX)
$execute store result score mz MazeGenerator run $(RandZ)

scoreboard players operation mx MazeGenerator *= 2 MazeGenerator
scoreboard players operation mz MazeGenerator *= 2 MazeGenerator

execute if score mx MazeGenerator matches 1.. run scoreboard players remove mx MazeGenerator 1
execute if score mz MazeGenerator matches 1.. run scoreboard players remove mz MazeGenerator 1
execute if score mx MazeGenerator matches ..-1 run scoreboard players add mx MazeGenerator 1
execute if score mz MazeGenerator matches ..-1 run scoreboard players add mz MazeGenerator 1

scoreboard players operation mx MazeGenerator += sx MazeGenerator
scoreboard players operation mz MazeGenerator += sz MazeGenerator

execute store result storage maze: dig.mx int 1 run scoreboard players get mx MazeGenerator
execute store result storage maze: dig.mz int 1 run scoreboard players get mz MazeGenerator

execute store result score isWall MazeGenerator run function maze:generator/is_wall with storage maze: dig
execute if score isWall MazeGenerator matches 1 run function maze:generator/random_move with storage maze: dig

scoreboard players operation cx MazeGenerator = mx MazeGenerator
scoreboard players operation cz MazeGenerator = mz MazeGenerator