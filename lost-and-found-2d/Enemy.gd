extends KinematicBody2D

const UP = Vector2(0, -1)
const GRAVITY = 20
const MAXFALLSPEED = 200
const MAXSPEED = 130
const JUMPFORCE = 600
const ACCELERATION = 10

var motion = Vector2()
var player_position = Vector2()
var facing_right = true

func _ready():
	pass

func _physics_process(delta):
	motion.y += GRAVITY
	motion.x = clamp(motion.x, -MAXSPEED, MAXSPEED)
	if motion.y > MAXFALLSPEED:
		motion.y = MAXFALLSPEED
	if facing_right == true:
		$EnemySprite.scale.x = 1
	else:
		$EnemySprite.scale.x = -1
