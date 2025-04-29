extends Node2D

var next_scene


func _ready() -> void:
	$AnimationPlayer.play("fade_in")


func go_to_scene(scene):
	get_tree().change_scene_to_file(scene)


func _on_button_pressed() -> void:
	next_scene = "res://Scenes/Menu/MainMenu.tscn"
	$AnimationPlayer.play("fade_out")


func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	if anim_name == "fade_out":
		go_to_scene(next_scene)
