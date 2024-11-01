extends Node2D

@export var force = -500.0

func _on_area_2d_area_entered(area):
	print("Okay")
	if area.get_parent() is Player:
		area.get_parent().velocity.y = force


func _on_area_2d_body_entered(body):
	print("Okay")
	if body is Player:
		body.velocity.y = force
	
