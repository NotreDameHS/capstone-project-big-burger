extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_timer_timeout() -> void:
	pass # Replace with function body.

func bet_outcome(choice) -> void:
	var outcome := randi_range(0, 1)
	if outcome == choice:
		print("YOU WIN!")
		give_money()
	elif outcome != choice:
		print ("YOU LOSE!")

func give_money() -> void:
	


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
