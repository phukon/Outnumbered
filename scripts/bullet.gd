extends RigidBody2D

var despawn_time = 1.5
onready var timer = $despawn_timer

func _ready() -> void:
	pass


func initialize(new_position, new_rotation):
	position = new_position
	rotation_degrees = new_rotation
	


func _on_Area2D_body_entered(body: Node) -> void:
	timer.start(despawn_time)


func _on_despawn_timer_timeout() -> void:
	queue_free()
