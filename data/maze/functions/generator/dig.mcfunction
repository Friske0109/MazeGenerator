#> maze:generator/dig

#今いる地点が壁なら掘る
$execute positioned $(cx) ~1 $(cz) if block ~ ~ ~ $(BaseBlock) run function maze:generator/digging with storage maze: dig

#採掘可能な方向を取得
$execute positioned $(cx) ~1 $(cz) run function maze:generator/get_diggable_direction with storage maze: dig

#採掘可能な方向が存在するなら、ランダムに選択して掘り進める
$execute positioned $(cx) ~ $(cz) unless score DiggableDirectionsCount MazeGenerator matches 0 run function maze:generator/choose_direction with storage maze: dig

#採掘可能な方向が存在しないなら、掘らずにランダム移動
$execute positioned $(cx) ~ $(cz) if score DiggableDirectionsCount MazeGenerator matches 0 run function maze:generator/random_move with storage maze: dig

#データを更新
function maze:generator/update_storage with storage maze: dig

#採掘可能な場所があるなら採掘
execute if score DiggableBlockCount MazeGenerator matches 1.. run function maze:generator/dig with storage maze: dig