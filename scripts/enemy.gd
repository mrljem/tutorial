extends CharacterBody2D
@onready var ray_cast_right: RayCast2D = $RayCastRight
@onready var ray_cast_left: RayCast2D = $RayCastLeft
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D


var SPEED = 130;
var DIRECTION = 1;

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	if ray_cast_right.is_colliding():
		DIRECTION = -1;
		animated_sprite_2d.flip_h = true
		
	if ray_cast_left.is_colliding():
		DIRECTION = 1;
		animated_sprite_2d.flip_h = false
		
func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity += get_gravity() * delta
		
	velocity.x = 50 * DIRECTION
	move_and_slide()
