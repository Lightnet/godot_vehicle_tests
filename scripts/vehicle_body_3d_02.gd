extends VehicleBody3D
# https://stackoverflow.com/questions/77146392/how-to-make-godot-4-3rd-person-camera-with-spring-arm
# https://godotforums.org/d/23258-how-to-make-the-player-mesh-move-not-with-but-based-on-the-camera-s-facing/2
#@onready var wheel_fl: VehicleWheel3D = $Wheel_FL
#@onready var wheel_fr: VehicleWheel3D = $Wheel_FR
#@onready var wheel_rl: VehicleWheel3D = $Wheel_RL
#@onready var wheel_rr: VehicleWheel3D = $Wheel_RR

@onready var spring_arm_3d: SpringArm3D = $SpringArm3D
@onready var camera_3d: Camera3D = $SpringArm3D/Camera3D
var sensitivity = 0.01
var mouse_sensitivity : float = 0.3
var min_pitch : float = -45
var max_pitch : float = 45

@export var MAX_STEER = 0.9
@export var ENGINE_POWER = 300

func _ready() -> void:
	print("Hello?wwwwwasdasdwasdwd")
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	pass
	
func _input(event: InputEvent) -> void:
	
	if event is InputEventMouseMotion:
		print("rotate")
		spring_arm_3d.rotation_degrees.y -= event.relative.x * mouse_sensitivity
		camera_3d.rotation_degrees.x -= event.relative.y * mouse_sensitivity
		camera_3d.rotation_degrees.x = clamp(camera_3d.rotation_degrees.x, min_pitch,max_pitch)
		
	if event.is_action_pressed("ui_cancel"):
		Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
	
func _physics_process(delta: float) -> void:
	#print("...")
	steering = move_toward(steering, Input.get_axis("right","left")*MAX_STEER, delta * 10)
	engine_force = Input.get_axis("backward","forward") * ENGINE_POWER
	#print("engine_force:", engine_force)
	#print("get_axis:", Input.get_axis("backward","forward") )
	if Input.is_action_pressed("break"):
		#engine_force = 0 #nope
		brake = 10
	else:
		brake = 0
	#print("engine_force:",engine_force)
	#print("brake: ",brake)
	#pass
