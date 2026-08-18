class_name HealthComponent
extends Node

@export var health: float = 100

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func removeHealth(value: float) -> void:
	health-=value
	print(health)
