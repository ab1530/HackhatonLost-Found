extends Node2D

const UP = Vector2(0, -1)
const GRAVITY = 20
const MAXFALLSPEED = 200
const MAXSPEED = 50
const JUMPFORCE = 600
const ACCELERATION = 10

var motion = Vector2()
var facing_right = true
var player_position = Vector2()
var enemy_position = Vector2()

func _ready():
	pass

func _physics_process(delta):
	motion.y += GRAVITY
	motion.x = clamp(motion.x, -MAXSPEED, MAXSPEED)
	enemy_position = $Enemy/EnemySprite.get_global_position()
	player_position = $Player/Sprite.get_global_position()
	
	if motion.y > MAXFALLSPEED:
		motion.y = MAXFALLSPEED
	if facing_right == true:
		$Enemy/EnemySprite.scale.x = 1
	else:
		$Enemy/EnemySprite.scale.x = -1
	if enemy_position.x > player_position.x + 90:
		motion.x -= ACCELERATION 
		facing_right = false
		print("enemy is on my right")
		$Enemy/AnimationPlayer.play("walk-knight")
	else:
		motion.x += ACCELERATION 
		facing_right = false
		print("enemy is on my left")
		$Enemy/AnimationPlayer.play("walk-knight")
	motion = $Enemy.move_and_slide(motion, UP)
