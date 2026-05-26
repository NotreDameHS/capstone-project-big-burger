extends Node2D


func give_money(amount: float, multiplier: float) -> void:
	money_amount *= amount
	money_changed.emit(player_money)
	
