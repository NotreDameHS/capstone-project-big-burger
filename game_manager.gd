extends Node2D

signal money_amount(amount:float)

@export var money_start : float

func _ready() -> void:
	money_amount.emit(money_start)
