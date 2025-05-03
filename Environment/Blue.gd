extends Node2D

func _ready():
	add_to_group("Keys")



func empty():
	if Input.is_action_just_pressed("blue") and not $"StaticBody2D/CollisionShape2D".disabled:
		$"StaticBody2D/Sprite".set_texture(load("res://Levels/BlueKhali.png"))
		$"StaticBody2D/CollisionShape2D".set_disabled(true)
	elif Input.is_action_just_pressed("blue") and $"StaticBody2D/CollisionShape2D".disabled:
		$"StaticBody2D/Sprite".set_texture(load("res://Levels/BlueWall.png"))
		$"StaticBody2D/CollisionShape2D".set_disabled(false)


func keyblue():
	add_to_group("Blue")
