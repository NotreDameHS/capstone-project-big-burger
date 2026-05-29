extends Area2D

var scene = preload("res://crash_game.tscn")
var game : PackedScene



func _on_body_entered(body: Node2D) -> void:
	print("HU")
	var game = scene.instantiate()
	get_parent().add_child(game)
	game.position = global_position
	pass # Replace with function body.


func _on_body_exited(body: Node2D) -> void:
	get_parent().get_child(6).queue_free()
	pass # Replace with function body.
