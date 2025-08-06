


extends Camera2D

@export var offset_margin: Vector2 = Vector2(10, 80)
@export var follow_speed: float = 5.0

func _ready():
	make_current()
	position = global_position

func _process(delta):
	if not get_parent():
		return

	var player = get_parent()

	var desired_position = global_position

	if player.global_position.x > global_position.x + offset_margin.x:
		desired_position.x = player.global_position.x - offset_margin.x
	elif player.global_position.x < global_position.x - offset_margin.x:
		desired_position.x = player.global_position.x + offset_margin.x

	if player.global_position.y > global_position.y + offset_margin.y:
		desired_position.y = player.global_position.y - offset_margin.y
	elif player.global_position.y < global_position.y - offset_margin.y:
		desired_position.y = player.global_position.y + offset_margin.y

	global_position = lerp(global_position, desired_position, follow_speed * delta)
																					  
