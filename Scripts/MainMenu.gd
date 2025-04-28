extends Node2D

var next_scene

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$AnimationPlayer.play("fade_in")

func go_to_scene(scene):
	get_tree().change_scene_to_file(scene)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_play_button_pressed() -> void:
	next_scene = "res://Scenes/GameScene.tscn"
	$AnimationPlayer.play("fade_out")

func _on_credits_button_pressed() -> void:
	next_scene = "res://Scenes/Menu/Credits.tscn"
	$AnimationPlayer.play("fade_out")

func _on_controls_button_pressed() -> void:
	next_scene = "res://Scenes/Menu/Controls.tscn"
	$AnimationPlayer.play("fade_out")


func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	if anim_name == "fade_out":
		go_to_scene(next_scene)
