extends Camera2D

const CAM_SPEED = 1.8


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var mouse_pos = get_global_mouse_position()
	
	if mouse_pos.x < position.x:
		position.x -= CAM_SPEED
	elif mouse_pos.x > position.x:
		position.x += CAM_SPEED
		
	if mouse_pos.y < position.y:
		position.y -= CAM_SPEED
	elif mouse_pos.y > position.y:
		position.y += CAM_SPEED
