extends Node2D

signal coin_landed()

var coin_flip_ui: Node
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	coin_flip_ui = get_node("../Coin Flip UI")
	coin_flip_ui.coin_flip_mind.connect(coin_transfer)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func coinflip():
	var outcome := randi_range(0, 1)
	if outcome == 1:
		return false
	elif outcome == 0:
		return true

func coin_transfer():
	var landed = coinflip()
	print(landed)
	coin_landed.emit(landed)



# choose a random number ## var outcome = randi_range(0, 1)
# create a "click to interact" UI that will give the option of heads or tails
# start timer when the button is clicked
# on_timer_timout() call bet_outcome()
# if win call give_money() if lose nothing
# 
# 
# 
# 
# 
# 
# 
# 
