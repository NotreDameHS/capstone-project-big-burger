extends Node2D

signal money_amount(amount:float)

@export var money_start := 100


func _ready() -> void:
	money_amount.emit(money_start)
