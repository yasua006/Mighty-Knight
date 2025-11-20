extends CharacterBody2D

@export var speed: int = 500
var JUMP_VELOCITY: int = -600   # hoppestyrke (negativ for å hoppe oppover)
var basis := 5
var gravity: int = 500

func _physics_process(delta: float) -> void:
	velocity = Vector2.ZERO

	# gravity
	velocity.y += gravity * delta

	# hopp (space)
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# bevegelser (WASD / ←↑↓→)
	if Input.is_action_pressed("move_right"):
		velocity.x += basis
	if Input.is_action_pressed("move_left"):
		velocity.x -= basis
	if Input.is_action_pressed("move_down"):
		velocity.y += basis
	if Input.is_action_pressed("move_up"):
		velocity.y -= basis

	# håndtere samtidig bevegelser
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed

	# bevege med delta
	move_and_slide()
