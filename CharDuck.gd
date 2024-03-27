extends CharacterBody3D

var text_toggle: bool=false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func interact():
	if text_toggle:
		# $Label3D.show()
		text_toggle=false
	else:
		# $Label3D.hide()
		text_toggle=true
