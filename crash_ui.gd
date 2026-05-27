extends CanvasLayer

@onready var player_input : LineEdit = $Panel/MarginContainer/HBoxContainer/VBoxContainer/Panel2/HBoxContainer/VBoxContainer/LineEdit
@onready var player_button : Button = $Panel/MarginContainer/HBoxContainer/VBoxContainer/Panel2/HBoxContainer/VBoxContainer/Button

@onready var crash_multiplier_label : Label = $Panel/MarginContainer/HBoxContainer/VBoxContainer/Panel/Label
@onready var crash_ui = Node
@onready var player_bet : float
@onready var crash_multiplier : float
@onready var counter : float

signal crash_mind()


func _ready() -> void:
	print(GameManager.money_amount)
	await get_tree().process_frame
	crash_delay()
	player_input.text_submitted.connect(print_input)
	player_button.pressed.connect(start_game)

func crash_delay():
	crash_ui = get_node("../Crash Set")
	crash_ui.crash_multiplier.connect(crash)
	
func print_input(text: String):
	var filter := ""
	var dot_used := false
	var valid = true
	for num in text:
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
		player_bet = 0.0
		return
	if text == "":
		player_input.placeholder_text = "Set Amount"
		player_bet = 0.0
		return
		pass
		
			
	if filter != text:
		text = filter
	var value : float = text.to_float()
	if value > GameManager.money_amount:
		player_input.text = ""
		player_input.placeholder_text = "U Dont Have that Bruh"
		player_bet = 0.0
		return
		
	crash_mind.emit()
	player_bet = value
	

func crash(mult : float):
	print("hi"+ str(mult))
	crash_multiplier_label.text = str(mult)
	crash_multiplier = mult
	pass
	
func start_game():
	if player_bet is float and player_bet != 0.0:
		print(player_bet)
		await countdown()
		while counter < crash_multiplier:
			print("test")
			counter += snapped(randf_range(0.01, 0.09), 0.01)
			crash_multiplier_label.text = str(counter)
			await get_tree().create_timer(0.1).timeout
		if counter > crash_multiplier:
			crash_multiplier_label.text = str(crash_multiplier)
	else: 
		return
	pass

func countdown():
	crash_multiplier_label.text = "3"
	await get_tree().create_timer(1.0).timeout
	crash_multiplier_label.text = "2"
	await get_tree().create_timer(1.0).timeout
	crash_multiplier_label.text = "1"
	await get_tree().create_timer(1.0).timeout
	crash_multiplier_label.text = "GO"
	await get_tree().create_timer(2.0).timeout
