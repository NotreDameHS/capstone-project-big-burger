extends Node2D
@export var amount: int

signal crash_multiplier(value:float)


var loop_count := 0

func _ready() -> void:
	var crash_mult = crash()
	print(crash_mult)
	crash_multiplier.emit(crash_mult)
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
	var crash_mult = crash()
	print(crash_mult)
	crash_multiplier.emit(crash_mult)
	pass # Replace with function body.
