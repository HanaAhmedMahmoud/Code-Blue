extends CharacterBody2D

func _ready():
	pass


func _process(delta: float) -> void:
	pass


func _on_heal_timer_timeout() -> void:
	$HealthComponent.health += 1
