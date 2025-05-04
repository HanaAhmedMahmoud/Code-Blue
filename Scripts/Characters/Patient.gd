extends CharacterBody2D


var player_near = false


func _ready() -> void:
	pass


func _physics_process(delta: float) -> void:
	pass


func _on_helpable_area_2d_body_entered(body: Node2D) -> void:
	player_near = true


func _on_helpable_area_2d_body_exited(body: Node2D) -> void:
	player_near = false
