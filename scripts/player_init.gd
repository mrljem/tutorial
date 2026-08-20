extends CharacterBody2D

var ARROW_SCENE = preload("res://scenes/Player/arrow.tscn")
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@export var arrow_velocity: float = 5

func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity += get_gravity() * delta
		
	if Input.is_action_just_pressed("attack"):
		var arrow: Arrow = ARROW_SCENE.instantiate()
		get_parent().add_child(arrow)
		
		arrow.global_position = global_position
		
		var direction: Vector2 = (get_global_mouse_position() - arrow.global_position).normalized()
		
		arrow.rotation = direction.angle()
		shoot(arrow, direction * arrow_velocity)
	
	move_and_slide()

func shoot(arrow: RigidBody2D, arrowVelocity: Vector2) -> void:
	arrow.apply_central_impulse(arrowVelocity)
