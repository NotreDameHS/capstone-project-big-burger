extends Node2D

signal money_signal(amount:float)
signal timer_signal(amount:float)
signal terminate_game(state:bool)
signal timer

@onready var game = get_node("/root/Game")
var money_start : float = 200
var money_amount : float

func _ready() -> void:
	money_amount = money_start
	if game:
		game.timer.connect(quota_check)
		print(money_start)
	
	
func _process(delta: float) -> void:
	#money_amount -= 1
	money_signal.emit(money_amount)
	
	pass # Replace with function body.

func quota_check():
	if money_amount <= 110:
		print("game over")
		terminate_game.emit()
	else:
		print("round 2")
	pass
