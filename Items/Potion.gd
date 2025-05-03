extends Node2D

func _on_Area2D_body_entered(body):
	$"AnimationPlayer".play("Collect")
	add()

func die():
	queue_free()

func add():
	get_tree().call_group("GameState", "addPotion")
