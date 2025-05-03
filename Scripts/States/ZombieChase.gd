extends State
class_name ZombieChase

var zombie
var player
var speed
var nav_agent



func enter():
	print("Zombie State -> Chase")
	
	zombie = get_parent().get_parent()
	
	player = get_tree().get_first_node_in_group("Player")
	
	nav_agent = zombie.get_node("NavigationAgent2D")
	
	speed = randi_range(600, 1000)
	
	zombie.modulate = Color("c42600")
	

func exit():
	pass


func update(_delta):
	pass


func physics_update(delta):
	nav_agent.target_position = player.global_position
	
	var direction = Vector2.ZERO
	direction = nav_agent.get_next_path_position() - zombie.global_position
	direction = direction.normalized()
	
	zombie.velocity = zombie.velocity.lerp(direction * speed, delta)
	
	zombie.move_and_slide()


func _on_chase_area_2d_body_exited(body: Node2D) -> void:
	get_parent().on_child_transition(self, "ZombiePatrol")


func _on_attack_range_body_entered(body: Node2D) -> void:
	get_parent().on_child_transition(self, "ZombieAttack")
