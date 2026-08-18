extends CharacterBody2D
class_name PlayerCar
@export var engine_force : float = 400.0
@export var brake_force : float = 150.0
@export var friction : float = 60.0
@export var steer_speed : float =150.0
@export var max_speed : float =340.0	
var last_Checkpoint : int = -1
var laps : int = 1
@export var max_laps : int = 3
@export var total_checkpoint : int = 4


var speed :float = 0.0

func _physics_process(delta: float) -> void:
	var throttle = Input.get_axis("brake","acceleration")
	var steer = Input.get_axis("steer_left","steer_right")
	
	apply_throttle(throttle, delta)
	apply_steering(steer, delta)
	
	velocity =Vector2.UP.rotated(rotation) * speed
	move_and_slide()
	
func apply_throttle(throttle, delta):
	if throttle > 0.0:
		speed += engine_force * throttle * delta
	elif throttle < 0.0:
		speed -= brake_force * abs(throttle) * delta
	else:
		
		
		speed = move_toward(speed, 0.0, friction * delta)
	
	speed = clamp(speed,-max_speed*0.3,max_speed)
		
func apply_steering(steer,delta):
	if abs(speed)<10.0:
		return
	rotation_degrees+=steer*steer_speed*delta
	
func on_checkpoint(checkpoint_number):
	if checkpoint_number == 0 and last_Checkpoint == total_checkpoint:
		laps +=1
		print("lap", laps )
		last_Checkpoint = checkpoint_number
