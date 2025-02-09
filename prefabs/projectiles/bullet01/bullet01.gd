extends RigidBody3D

var is_shoot = false
var DAMAGE = 50
var SPEED = 10

#func _ready() -> void:
	#pass

func _physics_process(_delta: float) -> void:
	if is_shoot:
		apply_impulse(-transform.basis.z, transform.basis.z)
	#pass

func _on_area_3d_body_entered(body: Node3D) -> void:
	#if body.is_in_group("Enemy"):
		#body.health -= DAMAGE
		#queue_free()
	#else:
		#queue_free()
	#queue_free()
	pass
