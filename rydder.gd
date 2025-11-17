extends CharacterBody2D

@export var speed: int = 500
var JUMP_VELOCITY: int = 400

func _physics_process(_delta: float) -> void:
	velocity = Vector2.ZERO
	
	# hopp (space)
	if Input.is_action_pressed("jump"):
		velocity.y = JUMP_VELOCITY
	# bevegelser (WASD / ←↑↓→)
	if Input.is_action_pressed("move_right"):
		velocity.x += 5
	if Input.is_action_pressed("move_left"):
		velocity.x -= 5
	if Input.is_action_pressed("move_down"):
		velocity.y += 5
	if Input.is_action_pressed("move_up"):
		velocity.y -= 5
	
	
	# håndtere samtidig bevegelser
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
	
	# bevege med delta
	move_and_slide()
