#> maze:generator/choose_direction

execute store result score ChosenDirection MazeGenerator run random value 1..12
scoreboard players operation ChosenDirection MazeGenerator %= DiggableDirectionsCount MazeGenerator

execute store result storage maze: dig.ChosenDirection int 1 run scoreboard players get ChosenDirection MazeGenerator

function maze:generator/set_chosen with storage maze: dig
function maze:generator/deeper with storage maze: dig.deeper