extends Node2D


#eventually a signal sent to here when the zombies are triggered 
@export var apocolpse = false 
@export var apocolpseComplete = false

@export var zomb_scene : PackedScene


func spawn_zombies():
	for i in range(Globals.spawn_at_time):
		var new_zombie = zomb_scene.instantiate()
		var spawn_pos = Globals.spawn_locations.pick_random()
		
		new_zombie.position = spawn_pos
		$Zombies.add_child(new_zombie)
	
	Globals.spawn_at_time += 1


func _ready() -> void:
	$CanvasLayer.show()
	$AnimationPlayer.play("fade_in")
	
	$ZombSpawner.start()
	
	spawn_zombies()
	
func _process(delta: float) -> void:
	pass


func _on_zomb_spawner_timeout() -> void:
	if not Settings.paused:
		spawn_zombies()


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("Zombies"):
		print("Zombie reached patients!")  # Game Over!
