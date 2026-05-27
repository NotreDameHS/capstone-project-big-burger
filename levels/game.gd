extends Node2D

signal timer()
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	GameManager.terminate_game.connect(stat)
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func stat():
	get_tree().quit()

func _on_timer_timeout() -> void:
	print("hi")
	timer.emit()
	pass # Replace with function body.
