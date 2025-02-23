extends VehicleBody3D

#@onready var wheel_fl: VehicleWheel3D = $Wheel_FL
#@onready var wheel_fr: VehicleWheel3D = $Wheel_FR
#
#@onready var wheel_rl: VehicleWheel3D = $Wheel_RL
#@onready var wheel_rr: VehicleWheel3D = $Wheel_RR

@export var MAX_STEER = 0.9
@export var ENGINE_POWER = 300

func _ready() -> void:
	#print("vehicle?")
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	pass
	
func _unhandled_input(event: InputEvent) -> void:
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
