extends Area2D
class_name CheckPoint

@export var CheckPoint_number : int = 0


func _on_body_entered(body: Node2D) -> void:
	if body is PlayerCar:
		body.on_checkpoint(CheckPoint_number)
