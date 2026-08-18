extends State

class_name IdleState
# Called when the node enters the scene tree for the first time.
func enter() -> void:
	state_machine.character.velocity.x = 0
	animatedSprite2d.play("idle")

func handle_input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("move_left") or Input.is_action_just_pressed("move_right"):
		state_machine.change_state("walkstate")
	elif Input.is_action_just_pressed("jump"):
		state_machine.change_state("jumpstate")
	pass
