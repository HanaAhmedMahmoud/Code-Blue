extends State
class_name ZombieChase

var zombie
var player
var speed


func enter():
	print("Zombie State -> Chase")
	
	zombie = get_parent().get_parent()
	player = get_tree().get_first_node_in_group("Player")
	
	speed = randi_range(200, 300)
	
	zombie.modulate = Color("c42600")
	

func exit():
	pass


func update(_delta):
	pass


func physics_update(_delta):
	var target_x = player.position.x
	var target_y = player.position.y
	var target = Vector2(target_x, target_y)
	
	var current_x = zombie.position.x
	var current_y = zombie.position.y
	
	if zombie.position.distance_to(target) > 80:
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


func _on_chase_area_2d_body_exited(body: Node2D) -> void:
	get_parent().on_child_transition(self, "ZombiePatrol")
