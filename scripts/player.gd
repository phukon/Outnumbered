extends KinematicBody2D


var speed = 500
var friction = 75
var acceleration = 100
var velocity = Vector2.ZERO
var bullet = preload("res://actors/bullet.tscn")
var bullet_speed = 700

func _ready() -> void:
	pass 



func _physics_process(delta: float) -> void:
	var input_vector = Vector2.ZERO
	look_at(get_global_mouse_position())
	
	input_vector.x = Input.get_action_strength("right") - Input.get_action_strength("left")
	input_vector.y = Input.get_action_strength("down") - Input.get_action_strength("up")
	input_vector = input_vector.normalized()
	
	if input_vector != Vector2.ZERO:
		velocity = velocity.move_toward(input_vector * speed, acceleration)
	else:
		velocity = velocity.move_toward(Vector2.ZERO, friction)
	
	velocity = move_and_slide(velocity)
	if Input.is_action_just_pressed("lmb"):
		fire()


func fire():
	var bullet_instance = bullet.instance()
	bullet_instance.initialize( get_global_position(), rotation_degrees)
	get_parent().add_child(bullet_instance)
	bullet_instance.apply_impulse(Vector2(), Vector2(bullet_speed, 0).rotated(rotation))


func kill():
	get_tree().reload_current_scene()

func _on_hitbox_body_entered(body: Node) -> void:
	if "enemy" in body.name:
		kill()
