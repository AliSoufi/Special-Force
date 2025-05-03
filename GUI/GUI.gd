extends CanvasLayer


func thunderGUI(thunder):
	$"Control/VBoxContainer/HBoxContainer/ThunderNUMBER".text = str(thunder)


func life(life):
	$"Control/VBoxContainer/HBoxContainer/LivesNUMBER".text = str (life)

func healthGUI(health):
	if health == 3:
		$"Control/VBoxContainer/TextureRect".texture = load("res://GUI/HealthFull.png")
	if health == 2:
		$"Control/VBoxContainer/TextureRect".texture = load("res://GUI/Health60.png")
	if health == 1:
		$"Control/VBoxContainer/TextureRect".texture = load("res://GUI/Health10.png")


func addThunder():
	var tmp = int ($"Control/VBoxContainer/HBoxContainer/ThunderNUMBER".text)
	print(tmp)
	tmp += 1
	$"Control/VBoxContainer/HBoxContainer/ThunderNUMBER".text = str(tmp)


func key():
	$"Control/VBoxContainer/HBoxContainer/Key".texture = load("res://Items/KeyGold.png")

func mousered():
	$"Control/HBoxContainer/Red".texture = load("res://GUI/RedMouse.png")


func mouseblue():
	$"Control/HBoxContainer/Blue".texture = load("res://GUI/BlueMouse.png") 


func hangtime(time):
	$"Control/HBoxContainer/HangTime".text = str(int(time))


func Restart():
	get_tree().call_group("GameState","restart")
