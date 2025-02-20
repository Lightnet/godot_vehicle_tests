extends Node3D

@onready var camera_pivot: Node3D = $"."
@onready var vehicle: VehicleBody3D = $".."

@onready var camera_3d: Camera3D = $Camera3D
@onready var back_camera_3d: Camera3D = $BackCamera3D

var look_at

var direction = -Vector3.FORWARD

func _ready() -> void:
	look_at = vehicle.global_position
	
	#direction = lerp(direction, current_velocity.normalized(), 1.0)
	camera_3d.global_transform.basis = get_rotation_from_direction(direction)
	#pass

func _physics_process(delta: float) -> void:
	camera_pivot.global_position = camera_pivot.global_position.lerp(vehicle.global_position,delta * 20.0)
	
	#camera_pivot.transform = camera_pivot.transform.interpolate_with(vehicle.transform, delta * 5.0)
	#camera_pivot.transform = camera_pivot.transform.interpolate_with(vehicle.transform, delta * 5.0)
	var current_velocity = vehicle.linear_velocity
	current_velocity.y = 0
	#print("delta: ", delta)
	if current_velocity.length_squared() > 0.5:
		direction = lerp(direction, current_velocity.normalized(), 10.0 * delta)
	camera_3d.global_transform.basis = get_rotation_from_direction(direction)
	
	#look_at = look_at.lerp(vehicle.global_position + + vehicle.linear_velocity, delta * 5.0)
	##camera_3d.look_at(vehicle.global_position + vehicle.linear_velocity)
	#camera_3d.look_at(look_at)
	#
	#back_camera_3d.look_at(look_at)
	#_check_camera_switch()
	#pass

func _check_camera_switch():
	if vehicle.linear_velocity.dot(vehicle.transform.basis.z) > 0.1:
		camera_3d.current = true
	else:
		back_camera_3d.current = true
	#pass

func get_rotation_from_direction(look_direction:Vector3) -> Basis:
	look_direction = look_direction.normalized()
	var x_axis = look_direction.cross(Vector3.UP)
	return Basis(x_axis, Vector3.UP, -look_direction)
