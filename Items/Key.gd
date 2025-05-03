extends Node2D


func _on_Area2D_body_entered(body):
	$AnimationPlayer.play("Collect")
	Collect()
	get_tree().call_group("GUI","key")

func die():
	queue_free()

func Collect():
	get_tree().call_group("Finish","opendoor")
