extends Area2D
@onready var hud = $"../HUD"

#export(NodePath) var hud

func _on_body_entered(body): 
	queue_free()
	hud.hasKey = true
