extends KinematicBody2D

#Stats
var thunders = 10
var motion = Vector2(0,0)
const UP = Vector2(0,-1)
#Movement
const GRAVITY = 60
const JUMP_SPEED = 700
const SPIKE_SPEED = 500
const BASESPEED = 60
var ACCELERATOR = 100
const BOOST_MULTIPLIER = 1.8
#Thunder
const THUNDER_ACCELERATOR = 1000
const THUNDER_JUMP = 100
#for end game
const World_LIMIT = 700

#Signals
signal animate
signal thunder


# warning-ignore:unused_argument
func _physics_process(delta):
	apply_gravity()
	animate()
	move()
	jump()
	change()
	avaz()
	thunder()
	timer()
	move_and_slide(motion , UP)
	
func apply_gravity():
	if position.y > World_LIMIT:
		get_tree().call_group("GameState","lifeReduce")
	if is_on_floor() and motion.y > 0:
		motion.y = 0
	elif is_on_ceiling():
		motion.y = 1
	else:
		motion.y += GRAVITY

func animate():
	emit_signal("animate",motion)


func move():
	if Input.is_action_pressed("left") and not Input.is_action_pressed("right"):
		motion.x = -BASESPEED -ACCELERATOR
	elif Input.is_action_pressed("right") and not Input.is_action_pressed("left"):
		motion.x = BASESPEED + ACCELERATOR
	else :
		motion.x = 0
		ACCELERATOR = BASESPEED


func jump():
	if Input.is_action_pressed("jump") and is_on_floor():
		motion.y = -JUMP_SPEED
		$JumpSFX.play()

#red changes
func change():
	get_tree().call_group("Red","empty")
	get_tree().call_group("Red","red")

#blue changes
func avaz():
	get_tree().call_group("Blue","empty")
	get_tree().call_group("Blue","blue")


func hurt():
	position.y -= 1
	yield(get_tree(),"idle_frame")
	motion.y = -SPIKE_SPEED


func thunder():
	if Input.is_action_just_pressed("thunder") and thunders > 0:
		if motion.x > 0:
			get_tree().call_group("GameState", "removeThunder")
			motion.y -= THUNDER_JUMP
			motion.x += THUNDER_ACCELERATOR
			ACCELERATOR += 150
			emit_signal("thunder")
			$"ُThunderSFX".play()

		elif motion.x < 0:
			get_tree().call_group("GameState", "removeThunder")
			motion.y -= THUNDER_JUMP
			motion.x -= THUNDER_ACCELERATOR
			ACCELERATOR += 150
			emit_signal("thunder")
			$"ُThunderSFX".play()


func boost():
	position.y -= 1
	yield(get_tree(),"idle_frame")
	motion.y = -(JUMP_SPEED * BOOST_MULTIPLIER)



func timer():
	var zaman = get_node("Timer")
	get_tree().call_group("GUI","hangtime", (10000 - zaman.get_time_left()))

