extends Node2D

signal timer()
@onready var time_left : int = 3
@onready var clock: int = time_left
@onready var start : bool
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$"Title Screen".gamestart.connect(gamestart)
	print("works")
	GameManager.terminate_game.connect(stat)
	$Timer.wait_time = 1
	timer.emit(clock)
	$Timer.start()
	pass # Replace with function body.


func gamestart():
	start = true
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func stat():
	get_tree().quit()

func _on_timer_timeout() -> void:
	if start:
		clock -= 1
		if clock <= 0:
			timer.emit(clock)
			time_left += 60
			clock = time_left
			return
		timer.emit(clock)
		pass # Replace with function body.
