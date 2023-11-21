#> maze:generator

scoreboard players set 2 MazeGenerator 2
scoreboard players set -1 MazeGenerator -1

$scoreboard players set sx MazeGenerator $(sx)
$scoreboard players set sz MazeGenerator $(sz)
$scoreboard players set ex MazeGenerator $(ex)
$scoreboard players set ez MazeGenerator $(ez)

scoreboard players operation dx MazeGenerator = ex MazeGenerator
scoreboard players operation dz MazeGenerator = ez MazeGenerator
scoreboard players operation dx MazeGenerator -= sx MazeGenerator
scoreboard players operation dz MazeGenerator -= sz MazeGenerator

#盤面の大きさが奇数であるか？(座標の差が偶数)
    scoreboard players operation b2x MazeGenerator = dx MazeGenerator
    scoreboard players operation b2z MazeGenerator = dz MazeGenerator
    scoreboard players operation b2x MazeGenerator %= 2 MazeGenerator
    scoreboard players operation b2z MazeGenerator %= 2 MazeGenerator

#盤面内のdiggable_blockの数を数える
    scoreboard players operation n2x MazeGenerator = dx MazeGenerator
    scoreboard players operation n2z MazeGenerator = dz MazeGenerator
    scoreboard players operation n2x MazeGenerator /= 2 MazeGenerator
    scoreboard players operation n2z MazeGenerator /= 2 MazeGenerator

    scoreboard players operation DiggableBlockCount MazeGenerator = n2x MazeGenerator
    scoreboard players operation DiggableBlockCount MazeGenerator *= n2z MazeGenerator
    execute if score DiggableBlockCount MazeGenerator matches ..-1 run scoreboard players operation DiggableBlockCount MazeGenerator *= -1 MazeGenerator

#初期位置設定
    scoreboard players operation cx MazeGenerator = sx MazeGenerator
    scoreboard players operation cz MazeGenerator = sz MazeGenerator

    execute if score sx MazeGenerator > ex MazeGenerator run scoreboard players remove cx MazeGenerator 1
    execute unless score sx MazeGenerator > ex MazeGenerator run scoreboard players add cx MazeGenerator 1
    execute if score sz MazeGenerator > ez MazeGenerator run scoreboard players remove cz MazeGenerator 1
    execute unless score sz MazeGenerator > ez MazeGenerator run scoreboard players add cz MazeGenerator 1

#storage設定
    data remove storage maze: dig
    execute store result storage maze: dig.sx int 1 run scoreboard players get sx MazeGenerator
    execute store result storage maze: dig.sz int 1 run scoreboard players get sz MazeGenerator
    execute store result storage maze: dig.ex int 1 run scoreboard players get ex MazeGenerator
    execute store result storage maze: dig.ez int 1 run scoreboard players get ez MazeGenerator
    execute store result storage maze: dig.cx int 1 run scoreboard players get cx MazeGenerator
    execute store result storage maze: dig.cz int 1 run scoreboard players get cz MazeGenerator
    execute store result storage maze: dig.n2x int 1 run scoreboard players get n2x MazeGenerator
    execute store result storage maze: dig.n2z int 1 run scoreboard players get n2z MazeGenerator

$data modify storage maze: dig.height set value $(height)
$data modify storage maze: dig.BaseBlock set value $(BaseBlock)

#乱数生成用引数の設定
    function maze:generator/random_setup with storage maze: dig

#例外処理
    execute if score b2x MazeGenerator matches 1 run tellraw @a "Invalid Numeric Value: サイズは奇数である必要がります。"
    execute if score b2x MazeGenerator matches 1 run return -1

    execute if score b2z MazeGenerator matches 1 run tellraw @a "Invalid Numeric Value: サイズは奇数である必要がります。"
    execute if score b2z MazeGenerator matches 1 run return -1

    execute if score DiggableBlockCount MazeGenerator matches ..3 run tellraw @a "Invalid Numeric Value: サイズは5x5以上である必要があります。"
    execute if score DiggableBlockCount MazeGenerator matches ..3 run return -1

#条件を満たす場合に穴掘り開始
function maze:generator/start_dig with storage maze: dig
return 0

