extends Node2D

var enterance


func _ready():
	enterance = get_node("PortalDestination").get_global_position()


func _on_Area2D_body_entered(body):
	self.position = enterance
