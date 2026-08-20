class_name Arrow

extends RigidBody2D
@export var max_damage: int = 100
@onready var arrow: RigidBody2D = $"."

var didHit: bool = false
@onready var timer: Timer = $Timer


func _physics_process(delta: float) -> void:
	if not didHit:
		rotation = linear_velocity.angle()

func _on_body_entered(body: Node) -> void:
	if didHit:
		return
	
	timer.start(2)
	didHit = true
	
	
	var health = body.get_node_or_null(Constants.HEALTH_COMPONENT) as HealthComponent
	
	if health:
		queue_free()
		_onHealthHit(health)
	print("Before:", global_position)

	

func _onHealthHit(healthComponent: HealthComponent) -> void:
	healthComponent.removeHealth(max_damage)
	healthComponent.get_parent().queue_free()


func _on_timer_timeout() -> void:
	queue_free()
