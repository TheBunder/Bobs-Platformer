extends CanvasLayer

var coins = 0

func _ready():
	$CoinsCount.text = String(coins) + "/" + "5"



func _on_coin_collected():
	coins = coins + 1
	_ready() 
	if coins == 5:
		yield(get_tree().create_timer(0.2), "timeout")
		get_tree().change_scene("res://Level1.tscn")
