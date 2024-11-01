extends CharacterBody2D
class_name Player

@onready var animation = $AnimationPlayer
@onready var sprite = $Sprite2D

@export var speed = 200.0
@export var jump_height = -400.0

@onready var sfx_jump_start = $sfx_jump_start
@onready var sfx_run_start = $sfx_run_start
@onready var sfx_attack_start = $sfx_attack_start
@onready var sfx_death_start = $sfx_death_start

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

@export var attacking = false

func _process(delta):
	if Input.is_action_just_pressed("attack"):
		attack()

func _physics_process(delta):
	if Input.is_action_pressed("left"):
		sprite.scale.x = abs(sprite.scale.x) * -1
	if Input.is_action_pressed("right"):
		sprite.scale.x = abs(sprite.scale.x)
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle Jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = jump_height

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * speed
	else:
		velocity.x = move_toward(velocity.x, 0, speed)
	update_animation()
	move_and_slide()
	
func attack():
	var overlapping_objects = $AttackArea.get_overlapping_areas()
	for area in overlapping_objects:
		var parent = area.get_parent()
		parent.queue_free()
		#if area.get_parent().is_in_group("Enemies"):
			#area.get_parent().queue_free()
			
	attacking = true
	animation.play("Attack")
	sfx_attack_start.play()
	
func update_animation():
	if !attacking:
		if velocity.x != 0:
			animation.play("Run")
			sfx_run_start.play()
		else: 
			animation.play("idle")
		if velocity.y < 0:
			animation.play("Jump")
			sfx_jump_start.play()
		if velocity.y > 0:
			animation.play("Fall")
			
#func die()
	#GameManager.respawn_player()
