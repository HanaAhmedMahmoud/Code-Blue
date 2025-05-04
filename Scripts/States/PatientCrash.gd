extends State
class_name PatientCrash

var player
var patient
var assist_difficulty
var crash_timer
var next_scene


func enter():
	player = get_tree().get_first_node_in_group("Player")
	patient = get_parent().get_parent()
	
	var time_can_wait = randi_range(10, 15)
	crash_timer = patient.get_node("CrashTimer")
	
	crash_timer.wait_time = time_can_wait
	crash_timer.start()
	
	assist_difficulty = randi_range(60, 90)
	
	patient.get_node("AnimationPlayer").play("indicator")
	patient.get_node("StateIndicator").text = "[center][b][color=red]!"


func exit():
	pass

func update(_delta):
	if not patient.dead and patient.player_near:
		if Input.is_action_just_released("assist"):
			patient.get_node("AnimationPlayer").play("assist")
			var success = randi_range(0, 100)
			
			if success > assist_difficulty:
				crash_timer.stop()
				get_parent().on_child_transition(self, "PatientNorm")


func physics_update(_delta):
	pass


func _on_crash_timer_timeout() -> void:
	patient.get_node("Sprite2D").hide()
	patient.get_node("AnimationPlayer").stop()
	
	patient.get_node("StateIndicator").text = "[center][b][color=black]X"
	
	Globals.patients_left -= 1
	patient.dead = true
	
