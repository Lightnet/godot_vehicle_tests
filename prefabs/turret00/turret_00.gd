extends Node3D
# https://www.youtube.com/watch?v=mmvIkkKJVlQ
# 

@export var accuracy:float = 0
@export var damage:float = 1

@onready var turret_base: MeshInstance3D = $Turret_Base
@onready var turret_ptich: MeshInstance3D = $Turret_Base/Turret_Ptich
@onready var turret_point: MeshInstance3D = $Turret_Base/Turret_Ptich/Turret_Point
@onready var camera: Camera3D = $"../Camera3D"

@onready var mesh_point: MeshInstance3D = $"../MeshPoint"

var target_position:Vector3 = Vector3.ZERO

#func _ready() -> void:
	#pass

#func _input(event: InputEvent) -> void:
	#pass

func _physics_process(_delta: float) -> void:
	#var win = get_viewport().position
	#print("get_window().position: ", get_window().position)
	var cam = get_viewport().get_camera_3d()
	#physics
	var space_state = get_world_3d().direct_space_state
	
	#mouse x,y
	var mouse_position = get_viewport().get_mouse_position()
	#mouse_position = Vector2(get_window().position) + mouse_position
	#mouse_position = mouse_position * 2
	#print("mouse_position: ", mouse_position)
	#camera point
	var rayOrigin = cam.project_ray_origin(mouse_position)
	#print("mouse_position:", mouse_position)
	#camer dir
	#var rayEnd = rayOrigin + camera.project_local_ray_normal(mouse_position) * 2000 #end point #offset a lot
	var rayEnd = rayOrigin + camera.project_ray_normal(mouse_position) * 2000 #end point
	#print("rayEnd: ", rayEnd)
	#query
	var query = PhysicsRayQueryParameters3D.create(rayOrigin, rayEnd)
	#print("query: ", query)

	var intersection = space_state.intersect_ray(query)
	#print("intersection: ", intersection)
	if not intersection.is_empty():
		#print("POS: ", intersection.position)
		var pos = intersection.position
		
		turret_base.look_at(pos,Vector3.UP)
		turret_base.rotation_degrees.x = clamp(turret_base.rotation_degrees.x,0,0)
		mesh_point.global_position = intersection.position
		#pass
		
	#pass
