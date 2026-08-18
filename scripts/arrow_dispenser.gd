extends StaticBody2D

@onready var arrow_dispenser: StaticBody2D = $"."
const arrow_scene = preload("res://scenes/arrow.tscn")
@onready var timer: Timer = $Timer

@export var numberOfArrows: int = 1
@export var spawnTime: float = 2
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	timer.wait_time = spawnTime
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_timer_timeout() -> void:
	if numberOfArrows < 1:
		return
	numberOfArrows -= 1
	var arrow: RigidBody2D = arrow_scene.instantiate()
	get_parent().add_child(arrow)
	arrow.global_position = global_position
