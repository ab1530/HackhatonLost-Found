extends StaticBody2D


func _ready():
	pass

func _physics_process(delta):
	if Input.is_action_just_pressed("display_text"):
		$Label.text = "YOUR TREASURE DISAPEEEEEAR\nFind it before someone else do!!!!\n----->"
