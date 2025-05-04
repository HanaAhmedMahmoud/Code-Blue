extends State
class_name ZombieAttack

var zombie
var player
var attack


func enter():
	zombie = get_parent().get_parent()
	player = get_tree().get_first_node_in_group("Player")

func exit():
	pass

func update(_delta):
	var attack_cooldown = zombie.get_node("AttackTimer")
	
	if player.get_node("StateMachine").current_state.name != "PlayerDeath":
		if attack_cooldown.is_stopped():
			var hurtbox = player.get_node("HurtboxComponent")
			var attack = Attack.new()
			
			attack.attack_damage = Globals.zombie_damage
			hurtbox.damage(attack)
			
			attack_cooldown.start()
	else:
		get_parent().on_child_transition(self, "ZombiePatrol")

func physics_update(_delta):
	pass


func _on_attack_range_body_exited(body: Node2D) -> void:
	get_parent().on_child_transition(self, "ZombieChase")
