extends Area2D

@export var speed = 400
var screen_size

func _ready():
	screen_size = get_viewport_rect().size

func _process(delta):
	playerMove(delta)


func playerMove(delta):
	var velocity = Vector2.ZERO
	if Input.is_action_pressed("right"):
		velocity.x += 1
	if Input.is_action_pressed("left"):
		velocity.x -= 1
	if Input.is_action_pressed("down"):
		velocity.y += 1
	if Input.is_action_pressed("up"):
		velocity.y -= 1

	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
		#$AnimatedSprite2D.play()
	#else:
		#$AnimatedSprite2D.stop()

	position += velocity * delta
	position = position.clamp(Vector2.ZERO, screen_size)
	
