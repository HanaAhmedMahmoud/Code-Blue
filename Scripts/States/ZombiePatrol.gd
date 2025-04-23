extends State
class_name ZombiePatrol

var zombie
var speed = 50

var target_x
var target_y


func set_target(current_x, current_y):
	var timer = zombie.get_node("PatrolTimer")
	
	target_x = current_x + randi_range(-200, 200)
	target_y = current_y + randi_range(-200, 200)
	
	timer.wait_time = randi_range(4, 6)
	timer.start()


func enter():
	print("Zombie State -> Patrol")
	
	zombie = get_parent().get_parent()
	
	set_target(zombie.position.x, zombie.position.y)
	
	zombie.modulate = Color("00823f")

func exit():
	pass

func update(_delta):
	pass

func physics_update(_delta):
	var current_x = zombie.position.x
	var current_y = zombie.position.y
	
	"""
	See if there is a better function for this.
	dist_to??
	"""
	
	var target = Vector2(target_x, target_y)
	
	if zombie.position.distance_to(target) > 10:
		if current_x < target_x:
			zombie.velocity.x = 1
		elif current_x > target_x:
			zombie.velocity.x = -1
		
		if current_y < target_y:
			zombie.velocity.y = 1
		elif current_y > target_y:
			zombie.velocity.y = -1
		
		zombie.velocity *= speed
	
	else:
		target_x = zombie.position.x
		target_y = zombie.position.y
		
		zombie.velocity.x = 0
		zombie.velocity.y = 0
	
	zombie.move_and_slide()

func _on_sight_area_2d_body_entered(body: Node2D) -> void:
	get_parent().on_child_transition(self, "ZombieChase")


func _on_patrol_timer_timeout() -> void:
	set_target(zombie.position.x, zombie.position.y)
