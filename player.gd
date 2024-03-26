extends CharacterBody3D

@export var SPEED = 5.0
@export var JUMP_VELOCITY = 5
@export_range(0, 0.5, 0.05) var mouse_sensetivity = 0.3

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")

@onready var _camera = $player_camera
var mouse_lock: bool


func _ready() -> void:
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	mouse_lock=true


func _input(event: InputEvent) -> void:
	if event is InputEventMouseMotion && Input.mouse_mode == Input.MOUSE_MODE_CAPTURED:
		_camera.rotate_x(deg_to_rad(-event.relative.y * mouse_sensetivity))
		rotate_y(deg_to_rad(-event.relative.x * mouse_sensetivity))
		_camera.rotation_degrees.x = clamp(_camera.rotation_degrees.x, -89.9, 89.9)
	
	
	if Input.is_action_just_pressed("escape"):
		if mouse_lock:
			Input.mouse_mode=Input.MOUSE_MODE_VISIBLE
			mouse_lock=false
		else:
			Input.mouse_mode=Input.MOUSE_MODE_CAPTURED
			mouse_lock=true


func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y -= gravity * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_dir = Input.get_vector("left", "right", "up", "down")
	var direction = (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)

	move_and_slide()
