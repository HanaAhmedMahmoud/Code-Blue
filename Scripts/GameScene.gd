extends Node2D

@onready var playerHealthComponent = $Player/HealthComponent
@onready var healthbar = $PlayerUIOverlay/PlayerUI/Healthbar

func _onHealthChange(new_health):
	print("changing health")
	playerHealthComponent.health_changed.connect(healthbar.setHealth)
 
#eventually a signal sent to here when the zombies are triggered 
@export var apocolpse = false 
@export var apocolpseComplete = false

@export var zomb_scene : PackedScene

func spawn_zombies():
	for i in range(Globals.spawn_at_time):
		var new_zombie = zomb_scene.instantiate()
		var spawn_pos = Globals.spawn_locations.pick_random()
		new_zombie.position = spawn_pos
		
		#initialise zombie health
		var healthbar = new_zombie.get_node("Healthbar")
		healthbar.call_deferred("init_health", Globals.zombieHealth)
		
		$Zombies.add_child(new_zombie)
	
	Globals.spawn_at_time += 1


func _ready() -> void:
	$CanvasLayer.show()
	$AnimationPlayer.play("fade_in")
	
	$ZombSpawner.start()
	
	spawn_zombies()
	
	healthbar.init_health(Globals.player_health)
	playerHealthComponent.health_changed.connect(_onHealthChange)
	
	
func _process(delta: float) -> void:
	pass


func _on_zomb_spawner_timeout() -> void:
	if not Settings.paused:
		spawn_zombies()


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("Zombies"):
		print("Zombie reached patients!")  # Game Over!
