extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	show()
	$Menu.hide()


func update_score(score):
	$CanvasLayer/ScoreLabel.text = str(Globals.total_score)


func go_to_scene(scene):
	get_tree().change_scene_to_file(scene)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("pause"):
		Settings.paused = not Settings.paused
		
		get_tree().paused = Settings.paused
	
	if not Settings.paused and $Menu.is_visible():
		$Menu.hide()
	elif Settings.paused and not $Menu.is_visible():
		$Menu.show()
	


func _on_return_button_pressed() -> void:
	Settings.paused = false
	get_tree().paused = false
	
	var next_scene = "res://Scenes/Menu/MainMenu.tscn"
	go_to_scene(next_scene)
