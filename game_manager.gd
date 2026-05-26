extends Node2D

signal money_change(amount:float)

@export var money_start: float

func _ready() -> void:
	money_change.emit(money_start)
