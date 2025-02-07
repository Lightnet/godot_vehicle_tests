extends Node

@onready var spring_arm_3d: SpringArm3D = $"."
@onready var camera_3d: Camera3D = $Camera3D

var sensitivity = 0.01
var mouse_sensitivity : float = 0.3
var min_pitch : float = -45
var max_pitch : float = 45

func _input(event: InputEvent) -> void:
	
	if Input.mouse_mode == Input.MOUSE_MODE_VISIBLE:
		return
	
	if event is InputEventMouseMotion:
		#print("rotate")
		#spring_arm_3d.rotation_degrees.y -= event.relative.x * mouse_sensitivity
		#camera_3d.rotation_degrees.x -= event.relative.y * mouse_sensitivity
		#camera_3d.rotation_degrees.x = clamp(camera_3d.rotation_degrees.x, min_pitch,max_pitch)
		
		spring_arm_3d.rotation_degrees.y -= event.relative.x * mouse_sensitivity
		
		spring_arm_3d.rotation_degrees.x -= event.relative.y * mouse_sensitivity
		spring_arm_3d.rotation_degrees.x = clamp(spring_arm_3d.rotation_degrees.x, min_pitch,max_pitch)
		
