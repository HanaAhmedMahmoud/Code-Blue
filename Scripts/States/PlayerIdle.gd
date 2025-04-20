extends State
class_name PlayerIdle

func enter():
	print("Player State -> Idle")

func exit():
	pass

func update(_delta):
	if (  # If any of the horizontal movement keys are pressed.
		Input.is_action_pressed("left") or 
		Input.is_action_pressed("right") or
		Input.is_action_pressed("up") or
		Input.is_action_pressed("down")
	):
		# Move if any of these are pressed.
		get_parent().on_child_transition(self, "PlayerMove")

func physics_update(_delta):
	pass
