extends State
class_name PlayerIdle

var player
var anim_player

func enter():
	print("Player State -> Idle")
	player = get_tree().get_first_node_in_group("Player")
	anim_player = player.get_node("AnimationPlayer")
	
	# Replace this with idle animation.
	anim_player.stop()

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
