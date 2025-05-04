extends State
class_name PatientNeedHelp

var player
var patient
var assist_difficulty
var wait_timer


func enter():
	player = get_tree().get_first_node_in_group("Player")
	patient = get_parent().get_parent()
	
	var time_can_wait = randi_range(10, 30)
	wait_timer = patient.get_node("WaitTimer")
	
	wait_timer.wait_time = time_can_wait
	wait_timer.start()
	
	assist_difficulty = randi_range(0, 40)
	
	patient.get_node("AnimationPlayer").play("indicator")
	patient.get_node("StateIndicator").text = "[center][b]?"


func exit():
	pass

func update(_delta):
	if not patient.dead and patient.player_near:
		if Input.is_action_just_released("assist"):
			patient.get_node("AnimationPlayer").play("assist")
			
			var success = randi_range(0, 100)
			
			if success > assist_difficulty:
				wait_timer.stop()
				get_parent().on_child_transition(self, "PatientNorm")

func physics_update(_delta):
	pass


func _on_wait_timer_timeout() -> void:
	get_parent().on_child_transition(self, "PatientCrash")
