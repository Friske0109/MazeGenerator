#> maze:generator/random_setup

$execute if score n2x MazeGenerator matches 1.. run data modify storage maze: dig.RandX set value "random value 1..$(n2x)"
$execute if score n2z MazeGenerator matches 1.. run data modify storage maze: dig.RandZ set value "random value 1..$(n2z)"

$execute if score n2x MazeGenerator matches ..-1 run data modify storage maze: dig.RandX set value "random value $(n2x)..-1"
$execute if score n2z MazeGenerator matches ..-1 run data modify storage maze: dig.RandZ set value "random value $(n2z)..-1"