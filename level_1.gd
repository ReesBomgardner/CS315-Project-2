extends Node2D


func _on_door_to_level_2_body_entered(body: Node2D) -> void:
	get_tree().change_scene_to_file("res://level2.tscn")
	pass # Replace with function body
