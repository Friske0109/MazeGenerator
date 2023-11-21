#> maze:generator/set_chosen

$data modify storage maze: dig.deeper.fill set from storage maze: dig.DiggableDirections[$(ChosenDirection)][0]
$data modify storage maze: dig.deeper.move set from storage maze: dig.DiggableDirections[$(ChosenDirection)][1]