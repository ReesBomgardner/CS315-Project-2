extends Area2D
var isOverDoor = false
var isLocked := true

@onready var hud = $"../HUD"
@onready var anim = $AnimationPlayer
@onready var sfx_door_start = $sfx_door_start

var next_scene = "res://level2.tscn"
@onready var scene_tree = get_tree()

func _on_body_entered(body):
	isOverDoor = true
	pass # Replace with function body.


func _on_body_exited(body):
	isOverDoor = false
	pass # Replace with function body.

func switch_scene():
#	Add scene to spawn to
	
	scene_tree.change_scene_to_file(next_scene)
	pass

func _on_near_door_body_entered(body):
	if body is not Player: return 

	if hud.hasKey:
		anim.play("Door")
		sfx_door_start.play()
		isLocked = false
		await anim.animation_finished
		switch_scene()
	pass # Replace with function body.
