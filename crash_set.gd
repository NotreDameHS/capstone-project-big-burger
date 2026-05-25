extends Node2D
@export var amount: int

var loop_count := 0

func _ready() -> void:
	crash()
	pass
func crash():
	loop_count = 0
	var num_set := []
	while loop_count < amount:
		
		var num := randf_range(1,20)
		num_set.append(num)
		loop_count += 1
		
	return snapped(num_set.min(),0.01)
	

func _on_timer_timeout() -> void:
	print(crash())
	pass # Replace with function body.
