#> maze:generator/start_dig

#フィールド生成
$fill $(sx) ~ $(sz) $(ex) ~$(height) $(ez) $(BaseBlock)

#採掘
execute positioned 0 0 0 run function maze:generator/dig with storage maze: dig

#log
tellraw @a "Info: 迷路の生成が完了しました。"