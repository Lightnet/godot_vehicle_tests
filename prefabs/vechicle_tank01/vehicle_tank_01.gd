extends VehicleBody3D

# tank
# No steering
# wheel change direction

@onready var wheel_fl: VehicleWheel3D = $Wheel_FL
@onready var wheel_fr: VehicleWheel3D = $Wheel_FR
@onready var wheel_rl: VehicleWheel3D = $Wheel_RL
@onready var wheel_rr: VehicleWheel3D = $Wheel_RR

@export var MAX_STEER = 0.9
@export var ENGINE_POWER = 300

func _ready() -> void:
	#print("Hello vehicle?")
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	pass
	
func _input(event: InputEvent) -> void:
	#if event is InputEventMouseMotion:
		#print("rotate")
		#spring_arm_3d.rotation_degrees.y -= event.relative.x * mouse_sensitivity
		#camera_3d.rotation_degrees.x -= event.relative.y * mouse_sensitivity
		#camera_3d.rotation_degrees.x = clamp(camera_3d.rotation_degrees.x, min_pitch,max_pitch)
		
	if event.is_action_pressed("ui_cancel"):
		if Input.mouse_mode == Input.MOUSE_MODE_VISIBLE:
			Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
		else:
			Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
	
func _physics_process(delta: float) -> void:
	#print("...")
	#steering = move_toward(steering, Input.get_axis("right","left")*MAX_STEER, delta * 10)
	#engine_force = Input.get_axis("backward","forward") * ENGINE_POWER
	
	if Input.is_action_pressed("forward"):
		wheel_fl.engine_force = ENGINE_POWER * 1
		wheel_fr.engine_force = ENGINE_POWER * 1
		
		wheel_rl.engine_force = ENGINE_POWER * 1
		wheel_rr.engine_force = ENGINE_POWER * 1
		
	elif Input.is_action_pressed("backward"):
		wheel_fl.engine_force = ENGINE_POWER * -1
		wheel_fr.engine_force = ENGINE_POWER * -1
		
		wheel_rl.engine_force = ENGINE_POWER * -1
		wheel_rr.engine_force = ENGINE_POWER * -1
	elif Input.is_action_pressed("right"):
		wheel_fl.engine_force = ENGINE_POWER * 1
		wheel_fr.engine_force = ENGINE_POWER * -1
		
		wheel_rl.engine_force = ENGINE_POWER * 1
		wheel_rr.engine_force = ENGINE_POWER * -1
	elif Input.is_action_pressed("left"):
		wheel_fl.engine_force = ENGINE_POWER * -1
		wheel_fr.engine_force = ENGINE_POWER * 1
		
		wheel_rl.engine_force = ENGINE_POWER * -1
		wheel_rr.engine_force = ENGINE_POWER * 1
	else:
		wheel_fl.engine_force = 0
		wheel_fr.engine_force = 0
		
		wheel_rl.engine_force = 0
		wheel_rr.engine_force = 0


	if Input.is_action_pressed("break"):
		#engine_force = 0 #nope
		#brake = 10
		wheel_fl.brake = 10
		wheel_fr.brake = 10
		wheel_rl.brake = 10
		wheel_rr.brake = 10
	else:
		#brake = 0
		wheel_fl.brake = 0
		wheel_fr.brake = 0
		wheel_rl.brake = 0
		wheel_rr.brake = 0
