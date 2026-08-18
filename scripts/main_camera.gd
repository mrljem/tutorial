extends Camera2D

@export var player: CharacterBody2D
@export var cameraSpeed: int = 5
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position.y -= cameraSpeed * delta


func _on_top_area_body_entered(body: Node2D) -> void:
	var player = body as CharacterBody2D
	if player:
		position.y = move_toward(position.y, player.position.y, 10) 
