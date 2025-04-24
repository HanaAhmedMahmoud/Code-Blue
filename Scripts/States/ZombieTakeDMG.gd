extends State
class_name ZombieTakeDMG

var zombie
var player


func enter():
	print("Zombie State -> TakeDMG")
	
	zombie = get_parent().get_parent()
	player = get_tree().get_first_node_in_group("Player")
	

func exit():
	pass


func update(_delta):
	pass


func physics_update(_delta):
	pass
