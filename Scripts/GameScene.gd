extends Node2D


#eventually a signal sent to here when the zombies are triggered 
@export var apocolpse = false 
@export var apocolpseComplete = false 

func _ready() -> void:
	$AnimationPlayer.play("fade_in")
	
func _process(delta: float) -> void:
	pass
