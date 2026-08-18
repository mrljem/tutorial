extends State

class_name JumpState
var character: CharacterBody2D = null

var JUMP_SPEED = 90
var JUMP_HEIGHT = -250
var JUMP_WALK_SPEED = 90
var JUMP_IDLE_SPEED = 90

func enter() -> void:
	var walkState = state_machine.previous_state as WalkState
	
	if walkState:
		JUMP_SPEED = JUMP_WALK_SPEED
	else:
		JUMP_SPEED = JUMP_IDLE_SPEED
	
	character = state_machine.get_parent() as CharacterBody2D
	character.velocity.y = JUMP_HEIGHT
	
func physics_update(delta: float) -> void:
	var character := state_machine.get_parent() as CharacterBody2D
	var direction := Input.get_axis("move_left", "move_right")
	
	if direction < 0:
		state_machine.animated_sprite_2d.flip_h = true
	else:
		state_machine.animated_sprite_2d.flip_h = false
	
	character.velocity.x = direction * JUMP_SPEED
	animatedSprite2d.play("jump")
	
	if character.is_on_floor():
		if direction != 0:
			state_machine.change_state("walkstate")
		else:
			state_machine.change_state("idlestate")
