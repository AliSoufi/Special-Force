extends Node2D

func _ready():
	add_to_group("Keys")


func red():
	if Input.is_action_just_pressed("change") and $"StaticBody2D/CollisionShape2D".disabled:
		$"StaticBody2D/Sprite".set_texture(load("res://Levels/RedWall.png"))
		$"StaticBody2D/CollisionShape2D".set_disabled(false)
	elif Input.is_action_just_pressed("change") and not $"StaticBody2D/CollisionShape2D".disabled:
		$"StaticBody2D/Sprite".set_texture(load("res://Levels/RedKhali.png"))
		$"StaticBody2D/CollisionShape2D".set_disabled(true)


func keyred():
	add_to_group("Red")
