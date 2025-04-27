extends Node

func play_sound(node_name):
	# If sound node exists and sound is enabled.
	if has_node(node_name) and Settings.play_sound_effects:
			get_node(node_name).play()


func _ready() -> void:
	pass


func _process(_delta: float) -> void:
	var back_track = get_node(Settings.current_background_track)
	
	# If background audio enabled.
	if Settings.play_background_audio:
		if not back_track.is_playing():
			back_track.play()
	
	else:  # Otherwise if background audio disabled.
		if back_track.is_playing():
			back_track.stop()
