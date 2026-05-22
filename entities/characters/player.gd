extends CharacterBody2D
@export var speed := 300.0
@export var rotation_speed := 10.0



func _physics_process(delta: float) -> void:
	var direction = Input.get_vector("left", "right", "up", "down")
	velocity = direction * speed
	move_and_slide()
	if direction.length() > 0:
		var target_angle = direction.angle()
		rotation = lerp_angle(rotation, target_angle, rotation_speed * delta)
