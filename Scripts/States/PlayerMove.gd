extends State
class_name PlayerMove

@export var speed = 400

var player
var anim_player

var player_direction

func enter():
	print("Player State -> Move")
	player = get_tree().get_first_node_in_group("Player")
	anim_player = player.get_node("AnimationPlayer")

func exit():
	pass

func update(_delta):
	pass

func physics_update(delta):
	player.velocity = Vector2.ZERO
	
	var anim_name = ""
	var current_anim = anim_player.current_animation
	
	if Input.is_action_pressed("right"):
		player.velocity.x += 1
		player_direction = "right"
		
	if Input.is_action_pressed("left"):
		player.velocity.x -= 1
		player_direction = "left"
		
	if Input.is_action_pressed("down"):
		player.velocity.y += 1
		player_direction = "down"
		
	if Input.is_action_pressed("up"):
		player.velocity.y -= 1
		player_direction = "up"

	if player.velocity.length() > 0:
		player.velocity = player.velocity.normalized() * speed
		
		anim_name = "move_" + player_direction
		
		if anim_name != "" and current_anim != anim_name:
			anim_player.play(anim_name)
		
	else:
		anim_name = "idle_" + player_direction
		anim_player.play(anim_name)
		
		anim_player.play(anim_name)  # Replace with correct idle anim.
		get_parent().on_child_transition(self, "PlayerIdle")

	player.position += player.velocity * delta
