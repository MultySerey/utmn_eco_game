extends Node3D

@onready var pause_menu_scene = $PauseMenu
var paused:bool=false

func _process(delta):
	if Input.is_action_just_pressed("escape"):
		pause_menu()

func pause_menu():
	if paused:
		Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
		pause_menu_scene.show()
		Engine.time_scale=0
	else:
		Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
		pause_menu_scene.hide()
		Engine.time_scale=1
		
	paused = !paused
