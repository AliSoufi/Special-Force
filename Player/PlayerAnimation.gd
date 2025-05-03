extends AnimatedSprite


func _on_Player_animate(motion):
	if motion.x < 0:
		play("walk")
		flip_h = true
	elif motion.x > 0:
		play("walk")
		flip_h = false
	else:
		play("stand")


func _on_Player_thunder():
	play("thunder")
