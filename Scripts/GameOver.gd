extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Globals.total_score += Globals.kill_count * 10
	Globals.total_score += Globals.patients_left * 50
	
	$GameOver/ScoreLabel.text = "Final Score: " + str(Globals.total_score) 
	$GameOver/Heading/Label.text = Globals.loss_cause


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/Menu/MainMenu.tscn")
	Globals.patients_left = 3
	Globals.player_health = 100
	Globals.spawn_at_time = 1
