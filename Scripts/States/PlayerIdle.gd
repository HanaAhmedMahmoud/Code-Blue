extends State
class_name PlayerIdle

var player
var anim_player

func enter():
	player = get_tree().get_first_node_in_group("Player")
	anim_player = player.get_node("AnimationPlayer")

func exit():
	player.get_node("HealTimer").stop()

func update(_delta):
	if Input.is_action_just_pressed("mouse_button_left"):
		get_parent().on_child_transition(self, "PlayerAttack")
	
	elif (  # If any of the horizontal movement keys are pressed.
		Input.is_action_pressed("left") or 
		Input.is_action_pressed("right") or
		Input.is_action_pressed("up") or
		Input.is_action_pressed("down")
	):
		# Move if any of these are pressed.
		get_parent().on_child_transition(self, "PlayerMove")
	
	if Globals.player_health < 100:
		var heal_timer = player.get_node("HealTimer")
		
		if heal_timer.is_stopped():
			heal_timer.start()

func physics_update(_delta):
	pass
