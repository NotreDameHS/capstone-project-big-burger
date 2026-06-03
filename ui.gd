extends CanvasLayer

@onready var quota : Label = $MarginContainer/HBoxContainer3/HBoxContainer/Panel/Label
@onready var timer: Label = $MarginContainer/HBoxContainer3/HBoxContainer2/Panel/Label
@onready var timer_amount: int = 10
@onready var timer_text: int = timer_amount
@onready var min : int
@onready var sec : int
func _ready() -> void:
	GameManager.money_signal.connect(money)
	GameManager.timer_signal.connect(timer_ui)
	pass

func _process(delta: float) -> void:
	pass

func money(amount:int,game_quota : int):
	quota.text = "Quota:" + "\n" + "$" + str(amount) + " / $" + str(game_quota)
	pass

	

func timer_ui(clock: int ):
	min = floor(clock/60)
	sec = clock - min * 60
	timer.text = "Timer:\n" + str(min) + ":" + str(sec).pad_zeros(2)
