extends CanvasLayer

@onready var heads_button : Button = $Panel/MarginContainer/HBoxContainer/VBoxContainer/Panel2/HBoxContainer/VBoxContainer/Heads
@onready var tails_button : Button = $Panel/MarginContainer/HBoxContainer/VBoxContainer/Panel2/HBoxContainer/VBoxContainer2/Tails
@onready var start_button : Button = $Panel/MarginContainer/HBoxContainer/VBoxContainer/Panel3/HBoxContainer/VBoxContainer/StartAmount
@onready var bet_amount : LineEdit = $Panel/MarginContainer/HBoxContainer/VBoxContainer/Panel3/HBoxContainer/VBoxContainer/BetAmount
@onready var title: Label = $Panel/MarginContainer/HBoxContainer/VBoxContainer/Panel/Title

@onready var player_bet : float
@onready var heads_choice: bool = false
@onready var tails_choice: bool = false
@onready var choice: bool = false
@onready var gamestarted: bool = false
@onready var coin_face: bool

var coin_flip_set: Node

signal coin_flip_mind()


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	start_button.pressed.connect(start_game)
	bet_amount.text_changed.connect(print_input)
	heads_button.pressed.connect(heads)
	tails_button.pressed.connect(tails)
	coin_flip_set = get_node("../Coin Flip Set")
	coin_flip_set.coin_landed.connect(heads_or_tails)
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func start_game():
	if gamestarted:
		return
	print("HI")
	print(player_bet)
	print(choice)
	if player_bet is float and player_bet != 0.0 and choice:
		title.modulate = Color(1,1,1)
		gamestarted = true
		GameManager.money_removed(player_bet)
		coin_flip_mind.emit()
		await countdown()
		print(coin_face)
		if coin_face == true:
			if tails_choice:
				GameManager.money_multiply(3, player_bet)
				title.modulate = Color(0,1,0)
			else:
				title.modulate = Color(1,0,0)
			title.text = "TAILS"
			
		elif coin_face == false:
			if heads_choice:
				GameManager.money_multiply(3,player_bet)
				title.modulate = Color(0,1,0)
			else:
				title.modulate = Color(1,0,0)
			title.text = "HEADS"
			pass
		gamestarted = false
		pass
	pass


func print_input(text: String):
		if gamestarted:
			bet_amount.placeholder_text = str(player_bet)
			return
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
			print("1")
			bet_amount.text = ""
			bet_amount.placeholder_text = "Numbers Only"
			player_bet = 0.0
			return
		if text == "":
			print("2")
			bet_amount.placeholder_text = "Set Amount"
			player_bet = 0.0
			return
			pass
		if filter != text:
			text = filter
		var value : float = text.to_float()
		if value > GameManager.money_amount:
			print("3")
			bet_amount.text = ""
			bet_amount.placeholder_text = "Insuff Amount"
			player_bet = 0.0
			return
		player_bet = value
		pass
func heads():
	if gamestarted:
		return
	heads_button.modulate = Color(0,1,0)
	tails_button.modulate = Color(0.0, 0.0, 0.0, 0.0)
	heads_choice = true
	tails_choice = false
	choice = true
func tails():
	if gamestarted:
		return
	heads_button.modulate = Color(0.0, 0.0, 0.0, 0.0)
	tails_button.modulate = Color(0,1,0)
	heads_choice = false
	tails_choice = true
	choice = true
	pass
func heads_or_tails(landed: bool):
	coin_face = landed
	pass
func countdown():
	title.text = "3"
	await get_tree().create_timer(1.0).timeout
	title.text = "2"
	await get_tree().create_timer(1.0).timeout
	title.text = "1"
	await get_tree().create_timer(1.0).timeout
