extends KinematicBody2D

var coins = 0
var velocity = Vector2.ZERO
const speed = 280
const jumpHight = -1100
const fallAcceleration = 35


func _physics_process(_delta):	
	if Input.is_action_pressed("Move_right"):
		velocity.x = speed
		$Sprites.flip_h = false
		$Sprites.play("walk")
	
	elif Input.is_action_pressed("Move_left"):
		velocity.x = -speed
		$Sprites.flip_h = true
		$Sprites.play("walk")
	elif Input.is_action_pressed("Move_down") || Input.is_action_pressed("Move_down_joycon"):
		$Sprites.play("duck")
		if Input.is_action_pressed("Move_down") || (Input.is_action_pressed("Move_down_joycon") && Input.is_action_just_pressed("prass_X")):
			position.y += 1
	else:
		$Sprites.play("idle")

	
	if !is_on_floor():
		$Sprites.play("in_air")
	
	if Input.is_action_just_pressed("Move_jump") && is_on_floor():
		velocity.y = jumpHight
	
	velocity.y = velocity.y + fallAcceleration
	
	velocity = move_and_slide(velocity, Vector2.UP)
	
	velocity.x = lerp(velocity.x,0, 0.2)
	
	
	
	



func add_coin():
	coins = coins+1

func _on_Fallzone_body_entered(_body):
	get_tree().change_scene("res://Level1.tscn")
