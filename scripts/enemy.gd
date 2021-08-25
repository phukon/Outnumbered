extends KinematicBody2D

var motion = Vector2()

func _ready() -> void:
	pass

func _physics_process(delta: float) -> void:
	var player_node = get_parent().get_node("player")
	
	position += (player_node.position - position)/50
	look_at(player_node.position)
	move_and_collide(motion)


func _on_Area2D_body_entered(body: Node) -> void:
	if "bullet" in body.name:
		queue_free()
