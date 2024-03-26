extends Label3D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass  # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var dist_to_player: Vector3 = global_position.direction_to(
		$"../../Player/PlayerCamera".global_position
	)
	rotation_degrees.y = 90 - rad_to_deg(atan2(dist_to_player.z, dist_to_player.x))
