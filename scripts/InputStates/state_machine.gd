extends Node

class_name StateMachine

@export var initial_state: State
@onready var animated_sprite_2d: AnimatedSprite2D = $"../AnimatedSprite2D"
@onready var character: CharacterBody2D = $".."

var current_state: State
var previous_state: State

var states: Dictionary = {}

func _ready() -> void:
	# setting all the available states
	for child in get_children():
		if child is State:
			states[child.name.to_lower()] = child
			child.state_machine = self
			child.animatedSprite2d = animated_sprite_2d
			
	# calling the inital state
	if initial_state:
		previous_state = initial_state
		change_state(initial_state.name.to_lower())

func _process(delta: float) -> void:
	if current_state:
		current_state.update(delta)

func _physics_process(delta: float) -> void:
	if current_state:
		current_state.physics_update(delta)
	
func _input(event: InputEvent) -> void:
	if current_state:
		current_state.handle_input(event)

func change_state(new_state: String) -> void:
	if current_state:
		current_state.exit()
	
	previous_state = current_state
	current_state = states.get(new_state.to_lower())
	if current_state:
		current_state.enter()
