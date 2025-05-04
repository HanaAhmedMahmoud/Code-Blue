extends ProgressBar


@onready var timer =  $Timer
@onready var damageBar =  $Damagebar

var health = 0 : set = setHealth


func setHealth(newHealth): 
	var prev_health = health 
	health = min(max_value, newHealth)
	value = health
	
	if health <= 0: 
		queue_free() 
	if health < prev_health: 
		timer.start()
	else:
		damageBar.value = health


func init_health(_health): 
	health = _health
	max_value = health
	value = health
	
	damageBar.max_value = health
	damageBar.value = health 


func _on_timer_timeout() -> void:
	damageBar.value = health 
