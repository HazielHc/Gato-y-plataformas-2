extends CharacterBody2D

const SPEED = 300.0
const JUMP_VELOCITY = -400.0
const MAX_JUMPS = 2
var jump_count = 0

@onready var animationPlayer = $AnimationPlayer
@onready var sprite2D = $Sprite2D

func _physics_process(delta: float) -> void:
	# Agrega la gravedad
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Reiniciar saltos si toca el suelo
	if is_on_floor():
		jump_count = 0

	# Manejo de saltos (doble salto)
	if Input.is_action_just_pressed("ui_accept") and jump_count < MAX_JUMPS:
		velocity.y = JUMP_VELOCITY
		jump_count += 1

	# Movimiento horizontal
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()

	animations(direction)

	# Dirección del sprite
	sprite2D.flip_h = direction < 0

func animations(direction):
	if is_on_floor():
		if direction == 0:
			animationPlayer.play("Idle")
		else:
			animationPlayer.play("run")
	else:
		if velocity.y < 0:
			animationPlayer.play("jump")
		elif velocity.y > 0:
			animationPlayer.play("fall")
