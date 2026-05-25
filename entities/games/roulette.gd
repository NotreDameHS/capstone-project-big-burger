extends Node2D
#0-36
#red
var red_num := [1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21, 23, 25, 27, 29, 31, 33, 35]
var black_num := [2, 4, 6, 8, 10, 12, 14, 16, 18, 20, 22, 24, 26, 28, 30, 32, 34, 36]
var green_num := [0]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	start_wait()
	pass # Replace with function body.

func start_wait() -> void:
	#buttons for what bet is happening blk_btn red_btn grn_btn
	start_bet()
	pass

func start_bet():
	var bet = randi_range(0, 36)
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
