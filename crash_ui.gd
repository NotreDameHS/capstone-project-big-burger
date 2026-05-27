extends CanvasLayer

@onready var player_input : LineEdit = $Panel/MarginContainer/HBoxContainer/VBoxContainer/Panel2/HBoxContainer/VBoxContainer/LineEdit
@onready var player_button : Button = $Panel/MarginContainer/HBoxContainer/VBoxContainer/Panel2/HBoxContainer/VBoxContainer/Button

@onready var crash_multiplier_label : Label = $Panel/MarginContainer/HBoxContainer/VBoxContainer/Panel/Label
@onready var crash_ui = Node


func _ready() -> void:
	print(GameManager.money_amount)
	await get_tree().process_frame
	crash_delay()
	player_input.text_submitted.connect(print_input)

func crash_delay():
	crash_ui = get_node("../Crash Set")
	crash_ui.crash_multiplier.connect(crash)
	
func print_input(text: String):
	var filter := ""
	var dot_used := false
	var valid = true
	for num in text:
		print(valid)
		if num.is_valid_float():
			filter += num
			valid = true
		elif num == "." and not dot_used:
			filter += num 
			dot_used == true
			valid = true
		else:
			valid = false
			break
	if not valid:
		player_input.text = ""
		player_input.placeholder_text = "Numbers Only"
	if text == "":
		player_input.placeholder_text = "Set Amount"
		pass
		
			
	if filter != text:
		text = filter
	var value : float = text.to_float()
	if value > GameManager.money_amount:
		player_input.text = ""
		player_input.placeholder_text = "U Dont Have that Bruh"

func crash(mult : float):
	print("hi"+ str(mult))
	crash_multiplier_label.text = str(mult)
	pass
	
