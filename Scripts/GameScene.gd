extends Node2D


#eventually a signal sent to here when the zombies are triggered 
@export var apocolpse = false 
@export var apocolpseComplete = false

@export var zomb_scene : PackedScene

func _ready() -> void:
	$AnimationPlayer.play("fade_in")
	$ZombSpawner.start()
	
func _process(delta: float) -> void:
	pass


func _on_zomb_spawner_timeout() -> void:
	var new_zombie = zomb_scene.instantiate()
	var spawn_pos = Globals.spawn_locations.pick_random()
	
	new_zombie.position = spawn_pos
	
	add_child(new_zombie)
