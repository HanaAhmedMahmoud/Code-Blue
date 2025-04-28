extends Node2D

const CAM_SPEED = 1.8


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var mouse_pos = get_global_mouse_position()
	
	if mouse_pos.x < $Camera2D.position.x:
		$Camera2D.position.x -= CAM_SPEED
	elif mouse_pos.x > $Camera2D.position.x:
		$Camera2D.position.x += CAM_SPEED
		
	if mouse_pos.y < $Camera2D.position.y:
		$Camera2D.position.y -= CAM_SPEED
	elif mouse_pos.y > $Camera2D.position.y:
		$Camera2D.position.y += CAM_SPEED


func _on_play_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/GameScene.tscn")


func _on_credits_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/Menu/Credits.tscn")

func _on_controls_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/Menu/Controls.tscn")
