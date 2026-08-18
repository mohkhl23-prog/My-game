extends PathFollow2D
@export var max_speed :float = 300.0
@export var laps :int = 0
@export var acceleration :float = 2.0

var speed : float 

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	speed += acceleration *delta
	progress+= speed * delta
	speed = clamp(speed, 0, max_speed)
	
