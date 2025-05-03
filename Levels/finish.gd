extends Area2D

var open = false

func _ready():
	add_to_group("Finish")

func nextLevel(body):
	if open == true:
		get_tree().call_group("GameState","levelUp")
		get_tree().call_group("GameState","saveData")
		print("res://Levels/Level" + str(int(get_tree().current_scene.name) + 1) + ".tscn")
		get_tree().change_scene("res://Levels/Level" + str(int(get_tree().current_scene.name) + 1) + ".tscn")

func opendoor():
	open = true
