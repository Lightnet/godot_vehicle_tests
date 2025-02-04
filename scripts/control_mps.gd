extends Control

@onready var l_mps_feed: Label = $VBoxContainer/HBoxContainer3/L_MPS_Feed
@onready var vehicle_body: VehicleBody3D = $"../.."
@onready var l_steering_feed: Label = $VBoxContainer/HBoxContainer4/L_Steering_feed
@onready var l_engine_force_feed: Label = $VBoxContainer/HBoxContainer2/L_Engine_Force_feed
@onready var l_brake_feed: Label = $VBoxContainer/HBoxContainer/L_Brake_feed

#func _ready() -> void:
	#pass

func _process(_delta: float) -> void:
	# https://forum.godotengine.org/t/godot-4-equivelent-to-basis-xform-inv/9847/2
	# 3.x?
	#var fwd_mps = vehicle_body.transform.basis.xform_inv().z
	# 4.x
	#var fwd_mps = (vehicle_body.transform.basis.transposed().x * vehicle_body.linear_velocity).z
	#var fwd_mps = (vehicle_body.transform.basis.inverse() * Vector3.UP * vehicle_body.linear_velocity).z
	
	# okay?
	#var fwd_mps = (vehicle_body.transform.basis.inverse() * vehicle_body.linear_velocity).z
	# okay
	var fwd_mps = vehicle_body.linear_velocity.length()
	
	#print("fwd_mps: ", fwd_mps)
	l_mps_feed.text = str(fwd_mps).pad_decimals(2)
	
	l_steering_feed.text = str(vehicle_body.steering).pad_decimals(2)
	l_engine_force_feed.text = str(vehicle_body.engine_force).pad_decimals(2)
	l_brake_feed.text = str(vehicle_body.brake).pad_decimals(2)
	
	
	#pass
