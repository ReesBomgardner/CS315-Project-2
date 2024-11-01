extends Node2D

func _on_area_2d_body_entered(body):
	if body is Player:
		GameController.gain_coins(1)
		queue_free()
		
	pass # Replace with function body.
