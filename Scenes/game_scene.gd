extends Node2D


#eventually a signal sent to here when the zombies are triggered 
@export var apocolpse = false 
@export var apocolpseComplete = false 

func _ready() -> void:
	$MainTheme.play()
	pass # Replace with function body.
	
func _process(delta: float) -> void:
	if apocolpse:
		$MainTheme.stop()
		$CombatTheme.play()
	pass
