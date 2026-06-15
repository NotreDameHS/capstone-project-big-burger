extends Node2D

signal money_signal(amount:float)
signal timer_signal(amount:int)
signal terminate_game(state:bool)



@onready var game = get_node("/root/Game")
@onready var crash = get_node("/root/Game/Area2D")
var money_start : float = 200
var money_amount : float
var quota : float = 100
var amount : float
var round : int = 0
func _ready() -> void:
	money_amount = money_start
	if game:
		game.timer.connect(quota_check)
		crash.moneymulta.connect(money_multiply)
		crash.moneyremoveda.connect(money_removed)
		print(money_start)
	
	
func _process(delta: float) -> void:
	#money_amount -= 1
	money_signal.emit(money_amount,quota)
	
	pass # Replace with function body.

func money_multiply(mult: float, player_bet: float):
	amount = mult * player_bet
	money_amount += amount
	pass
func money_removed(player_bet:float):
	print("this is being removed ", player_bet)
	money_amount -= player_bet
	print("this is amount", amount)
	pass

func quota_check(clock : int):
	timer_signal.emit(clock)
	if clock <= 0:
		if money_amount <= quota:
			print("game over")
			terminate_game.emit()
		else:
			round += 1
			quota = money_amount * 1.2
			print("round " + str(round))
		if round >= 5:
			print("You Win")
			terminate_game.emit()
	pass
	
