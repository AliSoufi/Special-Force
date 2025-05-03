extends Node2D

var data = {"HEALTH": 3 , "LEVELNUM":0}

func _ready():
	add_to_group("GameState")
	get_tree().call_group("GUI" , "life" )



func hurt():
	$Player.hurt()
	data.HEALTH -= 1
	get_tree().call_group("GUI","healthGUI",data.HEALTH)
	if data.HEALTH == 0:
		lifeReduce()

func levelUp():
	data.LEVELNUM += 1

func lifeReduce():
	get_tree().reload_current_scene()

#az potion
func addPotion():
	data.HEALTH += 1
	get_tree().call_group("GUI","healthGUI",data.HEALTH)


#az Thunder miad
func addThunder():
	$Player.thunders += 1
	get_tree().call_group("GUI","thunderGUI",$Player.thunders)

#az Player miad
func removeThunder():
	$Player.thunders -= 1
	get_tree().call_group("GUI","thunderGUI",$Player.thunders)


func teleport(area):
	for portal in get_tree().get_nodes_in_group("Portals"):
		if (portal != area):
			if portal.shomare == area.shomare:
				if area.lock == false:
					area.lock()
				$Player.global_position = portal.global_position


func restart():
	get_tree().reload_current_scene()


#func end_game():
#	get_tree().change_scene("res://Menu/GameOver.tscn")


#func resume():
	#loadData()
	#get_tree().change_scene("res://Levels/Level"+ str(data.LEVELNUM) +".tscn")

#func loadData():
#	var file = File.new()
#	if not file.file_exists(path):
#		resetData()
#		return
#	file.open(path,File.READ)
#var text = file.get_as_text()
#	data = parse_json(text)
#	file.close()


#func saveData():
#	var file = File.new()
	#file.open(path,File.WRITE)
#	file.store_line(to_json(data))
	#file.close()


#func resetData():
	#data = defaultValue.duplicate(true)
