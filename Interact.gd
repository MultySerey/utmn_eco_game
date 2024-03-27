extends RayCast3D

var c: int = 0


func _process(delta):
	var coll = self.get_collider()

	if self.is_colliding() and coll.is_in_group("Interactable"):
		if Input.is_action_just_pressed("interact"):
			coll.interact()
