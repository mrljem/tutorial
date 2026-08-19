extends CharacterBody2D

var ARROW_SCENE = preload("res://scenes/arrow.tscn")
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity += get_gravity() * delta
		
	if Input.is_action_just_pressed("attack"):
		var arrow: ArrowScene = ARROW_SCENE.instantiate()
		get_parent().add_child(arrow)
		arrow.global_position = global_position
		
		var direction = -1 if animated_sprite_2d.flip_h  else 1
		arrow.rotation = 0 if animated_sprite_2d.flip_h else PI
		
		arrow.shoot(Vector2(direction * 400, 0))
		
	move_and_slide()
