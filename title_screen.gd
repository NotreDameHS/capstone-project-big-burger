extends CanvasLayer
signal gamestart

@onready var play_button : Button = $MarginContainer/Panel/HBoxContainer/VBoxContainer2/PanelContainer/VBoxContainer/Play
@onready var quit_button : Button = $MarginContainer/Panel/HBoxContainer/VBoxContainer2/PanelContainer/VBoxContainer/Quit
@onready var scene : PackedScene = preload("res://levels/game.tscn")

func _ready() -> void:
	play_button.pressed.connect(play)
	quit_button.pressed.connect(quit)
	
func play():
	queue_free()
	gamestart.emit()
	
	
func quit():
	print("Goodbye")
	get_parent().queue_free()
	
