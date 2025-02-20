extends Node3D

@onready var camera_pivot: Node3D = $"."
@onready var vehicle: VehicleBody3D = $".."

@onready var camera_3d: Camera3D = $Camera3D

var look_at
@export var lerp_speed = 3.0
@export var offset = Vector3.ZERO
@export var target : Node
var direction = -Vector3.FORWARD

func _ready() -> void:
	#look_at = vehicle.global_position	
	#direction = lerp(direction, current_velocity.normalized(), 1.0)
	#camera_3d.global_transform.basis = get_rotation_from_direction(direction)
	pass

func _physics_process(delta: float) -> void:
	if !target:
		return
	#if vehicle.linear_velocity.length_squared() > 0:
		#var target_pos = target.global_transform.translated_local(offset)
		#camera_3d.global_transform = camera_3d.global_transform.interpolate_with(target_pos, lerp_speed * delta)
		#camera_3d.look_at(target.global_position, Vector3.UP)
	
	var target_pos = vehicle.global_transform.translated_local(offset)
	camera_pivot.global_transform = camera_pivot.global_transform.interpolate_with(target_pos, delta * 5.0)
	
	#var target_pos = target.global_transform.translated_local(offset)
	#camera_3d.global_transform = camera_3d.global_transform.interpolate_with(target_pos, lerp_speed * delta)
	#camera_3d.look_at(target.global_position, Vector3.UP)
	
	#camera_pivot.global_position = camera_pivot.global_position.lerp(vehicle.global_position,delta * 20.0)
	
	#camera_pivot.transform = camera_pivot.transform.interpolate_with(vehicle.transform, delta * 5.0)
	#camera_pivot.transform = camera_pivot.transform.interpolate_with(vehicle.transform, delta * 5.0)
	#var current_velocity = vehicle.linear_velocity
	#current_velocity.y = 0
	##print("delta: ", delta)
	#if current_velocity.length_squared() > 0.5:
		#direction = lerp(direction, current_velocity.normalized(), 10.0 * delta)
	#camera_3d.global_transform.basis = get_rotation_from_direction(direction)
	
	#look_at = look_at.lerp(vehicle.global_position + + vehicle.linear_velocity, delta * 5.0)
	##camera_3d.look_at(vehicle.global_position + vehicle.linear_velocity)
	#camera_3d.look_at(look_at)
	#
	#back_camera_3d.look_at(look_at)
	#_check_camera_switch()
	#pass

#func _check_camera_switch():
	#if vehicle.linear_velocity.dot(vehicle.transform.basis.z) > 0.1:
		#camera_3d.current = true
	#else:
		#back_camera_3d.current = true
	##pass

func get_rotation_from_direction(look_direction:Vector3) -> Basis:
	look_direction = look_direction.normalized()
	var x_axis = look_direction.cross(Vector3.UP)
	return Basis(x_axis, Vector3.UP, -look_direction)
