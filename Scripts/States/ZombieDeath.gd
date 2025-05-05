extends State
class_name ZombieDeath

var zombie


func enter():
	zombie = get_parent().get_parent()
	
	Globals.kill_count += 1
	zombie.queue_free()
	

func exit():
	pass


func update(_delta):
	pass


func physics_update(_delta):
	pass
