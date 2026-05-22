extends Area2D
var max_speed := 600.0
var velocity := Vector2(0, 0)
var steering_factor := 10.0



func _process(delta: float) -> void:
	var direction := Vector2(0, 0)
	direction.x = Input.get_axis("left", "right")
	direction.y = Input.get_axis("up", "down")

	if direction.length() > 1.0:
		direction = direction.normalized()
	
	if velocity.length() > 0.0:
		rotation = velocity.angle()
	
	var desired_velocity := direction * max_speed
	var steering_vector := desired_velocity - velocity
	
	velocity += steering_vector * steering_factor * delta
	position += velocity * delta
	pass
