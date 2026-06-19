extends "res://src/Actors/Actor.gd"

func _ready():
	velocity.x = -speed.x

func _physics_process(delta) -> void:
	velocity.y += gravity * delta
	if is_on_wall():
		velocity.x *= -1.0
	velocity.y = move_and_slide(velocity, FLOOR_NORMAL).y

func _on_StompDetector_body_entered(body):
	if body.global_position.y > get_node("StompDetector").global_position.y:
		return
	die()

func die() -> void:
	queue_free()
