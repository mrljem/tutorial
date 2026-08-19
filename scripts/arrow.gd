class_name ArrowScene

extends RigidBody2D
@export var max_damage: int = 100
@onready var arrow: RigidBody2D = $"."

var canDamage: bool = true
var didHit: bool = false

func _ready() -> void:
	gravity_scale = 0

func _physics_process(delta: float) -> void:
	if not didHit:
		rotation = linear_velocity.angle()

func _on_body_entered(body: Node) -> void:
	if didHit:
		return
	gravity_scale = 1
	var health = body.get_node_or_null(Constants.HEALTH_COMPONENT) as HealthComponent
	
	if health && canDamage:
		health.removeHealth(1)
	
	canDamage = false
	didHit = true
	
func shoot(velocity: Vector2) -> void:
	apply_impulse(velocity)
