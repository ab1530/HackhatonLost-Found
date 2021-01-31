extends KinematicBody2D

const UP = Vector2(0, -1)
const GRAVITY = 20
const MAXFALLSPEED = 200
const MAXSPEED = 130
const JUMPFORCE = 600
const ACCELERATION = 10

var motion = Vector2()
var facing_right = true


func _ready():
	pass 

func _physics_process(delta):
	motion.y += GRAVITY
	motion.x = clamp(motion.x, -MAXSPEED, MAXSPEED)
	if motion.y > MAXFALLSPEED:
		motion.y = MAXFALLSPEED
	if facing_right == true:
		$Sprite.scale.x = 1
	else:
		$Sprite.scale.x = -1
	if Input.is_action_pressed("right"):
		motion.x += ACCELERATION 
		facing_right = true
		$AnimationPlayer.play("running")
	elif Input.is_action_pressed("left"):
		motion.x -= ACCELERATION
		facing_right = false
		$AnimationPlayer.play("running")
	elif Input.is_action_pressed("attack"):
		$AnimationPlayer.play("attaque")
	else:
		motion.x = lerp(motion.x, 0, 0.2)
		$AnimationPlayer.play("Idle")
	if is_on_floor():
		if Input.is_action_just_pressed("jump"):
			motion.y = -JUMPFORCE
	else:
		if motion.y < 0:
			$AnimationPlayer.play("jumping")
		elif motion.y > 0:
			$AnimationPlayer.play("falling")
		
	motion = move_and_slide(motion, UP)
