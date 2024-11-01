extends Node

signal gained_coins(int)
var coins = 0
var player: Player

func gain_coins(coins_gained):
	coins += coins_gained
	emit_signal("gained_coins", coins_gained )
