extends Node2D


func _on_Area2D_body_entered(body):
	$AnimationPlayer.play("Collect")
	collect()
	queue_free()


func collect():
	get_tree().call_group("Keys","keyblue")
	get_tree().call_group("GUI","mouseblue")
