extends Node2D
@export var cards: Array[CompressedTexture2D]
var new_card: CompressedTexture2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.
	



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func random_number():
	var number := randi_range(1,13)
	return number
	pass
	
func blackjack() -> void:
	var card_1 : int
	var card_2 : int 
	var dealer_card_1 : int
	var dealer_card_2 : int
	
	
	pass
	


func _on_timer_timeout() -> void:
	blackjack()
	pass # Replace with function body.
