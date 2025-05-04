extends State
class_name ZombieTakeDMG


func enter():
	pass
	

func exit():
	pass


func update(_delta):
	get_parent().on_child_transition(self, "ZombieChase")


func physics_update(_delta):
	pass
