extends CanvasLayer
@onready var key = $"../Key"
var hasKey := false
@onready var coin_label = $Panel/Label

var coin = 0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	GameController.gained_coins.connect(update_coin_score)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func update_coin_score(score):
	coin += score
	coin_label.text = "Coin: " + str(coin)
	pass
