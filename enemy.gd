extends CharacterBody2D

@export var player = Node
var chase = false

const SPEED = 150.0
const JUMP_VELOCITY = -400.0


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
	var direction = 0
	if chase:
		if player.global_position.x < global_position.x:
			direction = -1
		else:
			direction = 1
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()


func _on_detection_body_entered(body: Node2D) -> void:
	if body.name == "ridder":
		chase = true


func _on_detection_body_exited(body: Node2D) -> void:
	if body.name == "ridder":
		chase = false
