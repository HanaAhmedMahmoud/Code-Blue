extends State
class_name ZombiePatrol

var zombie
var timer

var speed = randi_range(600, 800)
var nav_agent

var anim_player



func play_anim(anim_name):
	if anim_player.current_animation != anim_name:
		anim_player.play(anim_name)


func enter():
	print("Zombie State -> Patrol")
	
	zombie = get_parent().get_parent()
	
	anim_player = zombie.get_node("AnimationPlayer")
	timer = zombie.get_node("PatrolTimer")
	
	nav_agent = zombie.get_node("NavigationAgent2D")
	
	timer.start()

func exit():
	pass

func update(_delta):
	pass

func physics_update(delta):
	if zombie.global_position.distance_to(nav_agent.target_position) > 100:
		var direction = Vector2.ZERO
		direction = nav_agent.get_next_path_position() - zombie.global_position
		direction = direction.normalized()
		
		zombie.velocity = zombie.velocity.lerp(direction * speed, delta)
		
		zombie.move_and_slide()
		
		if direction.x > 0:
			play_anim("move_right")
		elif direction.x < 0:
			play_anim("move_left")
	
	else:
		nav_agent.target_position = Globals.patrol_locations.pick_random()

func _on_sight_area_2d_body_entered(body: Node2D) -> void:
	get_parent().on_child_transition(self, "ZombieChase")


func _on_patrol_timer_timeout() -> void:
	nav_agent.target_position = Globals.patrol_locations.pick_random()
	timer.wait_time = 15
	
	timer.start()
