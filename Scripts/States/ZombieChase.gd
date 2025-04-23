extends State
class_name ZombieChase

func enter():
	print("Zombie State -> Chase")

func exit():
	pass

func update(_delta):
	pass

func physics_update(_delta):
	pass


func _on_sight_area_2d_body_exited(body: Node2D) -> void:
	get_parent().on_child_transition(self, "ZombiePatrol")
