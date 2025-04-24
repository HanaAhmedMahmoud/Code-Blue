extends State
class_name ZombieDeath

var zombie


func enter():
	print("Zombie State -> Death")
	
	zombie = get_parent().get_parent()
	
	zombie.queue_free()
	

func exit():
	pass


func update(_delta):
	pass


func physics_update(_delta):
	pass
