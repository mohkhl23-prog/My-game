extends Area2D

@onready var lap_label: Label = $"../CanvasLayer/Label"

var current_lap: int = 1

func _ready() -> void:
	update_ui()
	body_entered.connect(_on_body_entered)

func _on_body_entered(body: Node2D) -> void:
	# Checks if the entering body is in the "player" group
	if body.is_in_group("player"):
		current_lap += 1
		update_ui()

func update_ui() -> void:
	if lap_label:
		lap_label.text = "Lap: " + str(current_lap)
