extends CanvasLayer

@onready var quota : Label = $MarginContainer/HBoxContainer3/HBoxContainer/Panel/Label


func _ready() -> void:
	GameManager.money_signal.connect(money)
	pass

func money(amount:int):
	quota.text = "Quota:" + "\n" + "$" + str(amount) + " / $100"
	pass
