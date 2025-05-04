extends State
class_name PatientNorm

var player
var patient


func enter():
	player = get_tree().get_first_node_in_group("Player")
	patient = get_parent().get_parent()
	
	var time_until_help = randi_range(20, 60)
	var help_timer = patient.get_node("HelpTimer")
	
	help_timer.wait_time = time_until_help
	help_timer.start()
	
	patient.get_node("StateIndicator").text = "[center][b]"

func exit():
	pass

func update(_delta):
	pass

func physics_update(_delta):
	pass


func _on_help_timer_timeout() -> void:
	get_parent().on_child_transition(self, "PatientNeedHelp")
