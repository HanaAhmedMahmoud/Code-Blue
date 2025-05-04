extends Node

@export var bullet_damage = 1
@export var bullet_speed = 1000

@export var zombieHealth = 3
@export var zombie_damage = 1

@export var patrol_locations = [
	Vector2(1130, 1788), Vector2(-867, -637), Vector2(-2172, -1108),
	Vector2(1017, -906), Vector2(468, 1828), Vector2(468, 543),
	Vector2(906, 540),
]

@export var spawn_locations = [
	Vector2(-867, -637), Vector2(-2172, -1108), Vector2(1017, -906),
	Vector2(-3027, 120), Vector2(-1559, -2205), Vector2(2486, -1240)
]

var scalpel = "res://Art/Items/playersizescalpel.png"
var syringe = "res://Art/Items/playersizesyringe.png"

var projectile_sprites = [syringe, scalpel]

var patient_positons = [
	Vector2(461, 476), Vector2(907, 476), Vector2(1318, 476)
]

var player_health = 100

var spawn_at_time = 1

var total_score = 0

var patients_left = 3

var loss_cause = ""
