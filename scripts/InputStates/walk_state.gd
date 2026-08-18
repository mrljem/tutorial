extends State

class_name WalkState
# Called when the node enters the scene tree for the first time.
const ACCELERATION := 220
const SPEED := 120

func enter() -> void:
	animatedSprite2d.play("run")

func physics_update(delta: float) -> void:
	var direction := Input.get_axis("move_left", "move_right")
	var character := state_machine.get_parent() as CharacterBody2D
	
	var moving_left := Input.is_action_pressed("move_left")
	var moving_right := Input.is_action_pressed("move_right")
	
	if direction:
		if (character.velocity.x < 0 and direction == 1) or (character.velocity.x > 0 and direction == -1):
			character.velocity.x = 0
		character.velocity.x = move_toward(character.velocity.x, direction * SPEED, ACCELERATION * delta)
	else:
		character.velocity.x = move_toward(character.velocity.x, 0, SPEED)
		
	if direction < 0:
		animatedSprite2d.flip_h = true
	elif direction > 0:
		animatedSprite2d.flip_h = false

	if not moving_left and not moving_right:
		state_machine.change_state("idlestate")
	
	
func handle_input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("jump"):
		state_machine.change_state("jumpstate")
