extends Area2D

var scene = preload("res://entities/coin_flip.tscn")
var game : Node
signal moneymulta
signal moneyremoveda



func _on_body_entered(body: Node2D) -> void:
	print("HU")
	var game = scene.instantiate()
	game.name = "Crash Game"
	get_parent().add_child(game)
	game.position = global_position
	var crash_ui = game.get_node("Crash UI")
	crash_ui.moneyremove.connect(moneybeingremoved)
	crash_ui.moneymult.connect(moneymultiplier)
	pass # Replace with function body.


func _on_body_exited(body: Node2D) -> void:
	get_parent().get_node_or_null("Crash Game").queue_free()
	pass # Replace with function body.

func moneymultiplier(mult: float ,amount: float):
	moneymulta.emit(mult,amount)
func moneybeingremoved(player_bet:float):
	moneyremoveda.emit(player_bet)
