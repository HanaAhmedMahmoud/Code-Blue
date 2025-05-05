extends Node2D

@onready var playerHealthComponent = $Player/HealthComponent
@onready var healthbar = $PlayerUIOverlay/PlayerUI/Healthbar
var next_scene 

func go_to_scene(scene):
	get_tree().change_scene_to_file(scene)

func _onHealthChange(new_health):
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
	if Globals.patients_left <= 0:
		Globals.loss_cause = "Your patients died of neglect..."
		next_scene = "res://Scenes/Menu/GameOver.tscn"
		$AnimationPlayer.play("fade_out")
		
	if Globals.player_health <= 0: 
		Globals.loss_cause = "You were torn apart by zombies..."
		next_scene = "res://Scenes/Menu/GameOver.tscn"
		$AnimationPlayer.play("fade_out")

func _on_zomb_spawner_timeout() -> void:
	if not Settings.paused:
		spawn_zombies()

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("Zombies"):
		Globals.loss_cause = "Zombies reached the patients..."
		next_scene = "res://Scenes/Menu/GameOver.tscn"
		$AnimationPlayer.play("fade_out")

func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	if anim_name == "fade_out":
		go_to_scene(next_scene)

func _on_score_timer_timeout() -> void:
	Globals.total_score += 1
	$Ui.update_score(Globals.total_score)
	$ScoreTimer.start()
