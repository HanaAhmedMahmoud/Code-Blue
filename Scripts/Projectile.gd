extends Area2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	look_at(get_global_mouse_position())
	
	AudioManager.play_sound("SharpSound")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	move_local_x(Globals.bullet_speed * delta)


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("Zombies"):
		var hurtbox = body.get_node("HurtboxComponent")
		var attack = Attack.new()
				
		attack.attack_damage = Globals.bullet_damage
		hurtbox.damage(attack)
		
		self.queue_free()
