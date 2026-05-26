extends CanvasLayer

@onready var quota : Label = $MarginContainer/HBoxContainer3/HBoxContainer/Panel/Label


func _ready() -> void:
	quota.text = str(GameManager.money_start)
	pass
