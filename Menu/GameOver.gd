extends Control


func _physics_process(delta):
	if Input.is_action_pressed("enter"):
		get_tree().change_scene("res://Levels/Start.tscn")


func _on_Restart_pressed():
	get_tree().change_scene("res://Levels/Start.tscn")
