extends Node
class_name HealthComponent

@export var health : int
@export var max_health : int

#signal for player health 
signal health_changed(new_health)

"""
Note: States used here are unfinished.
"""


func _process(delta: float) -> void:
	if get_parent().get_groups()[0] == "Player":
		if Globals.player_health != health:
			Globals.player_health = health

func heal():
	health += 1
	emit_signal("health_changed", health)


func damage(attack: Attack):
	# Get the state machine of the parent node.
	var state_machine = get_parent().get_node("StateMachine")
	health -= attack.attack_damage
	
	# update any health bar
	if get_parent().has_node("Healthbar"):
		var healthbar = get_parent().get_node("Healthbar")
		healthbar.health = health
	
	# If player, update the global variables as well.
	if get_parent().name == "Player":
		Globals.player_health = health
		emit_signal("health_changed", health)
	
	if health <= 0:  # If health is less than 1, parent node 'dies'.
		
		var death_state = ""
		
		# Get the death state of the parent node.
		match get_parent().get_groups()[0]:
			"Player":
				death_state = "PlayerDeath"
			"Zombies":
				$"../ZombieDeath".play()
				$"..".modulate = Color(1, 0, 0)
				await get_tree().create_timer(0.5).timeout 
				death_state = "ZombieDeath"
		
		# If parent node has a death state, switch to the state.
		if death_state != "" and state_machine.has_node(death_state):
			state_machine.on_child_transition(state_machine.current_state, death_state)
	
	
	else:  # If there is enough health left to survive.
		var hit_state = ""
		
		# Get the hit state of the parent node.
		match get_parent().get_groups()[0]:
			"Player":
				hit_state = "PlayerTakeDMG"
			"Zombies":
				hit_state = "ZombieTakeDMG"
		
		# If a hit state exists, switch to it.
		if hit_state != "" and state_machine.has_node(hit_state):
			state_machine.on_child_transition(state_machine.current_state, hit_state)
	
