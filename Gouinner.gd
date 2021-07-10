extends Area2D
enum Status{FLY, STAND}

signal on_change_status(s)
const speed = 200
const f = 800
# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var direction = Vector2(1, 0)
var vibration = Vector2(0, 0)
var circle_direction = 1
var status = Status.STAND


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func get_input():
	if Input.is_action_just_pressed("space"):
		print(status)
		match status:
			Status.STAND:
				status = Status.FLY
			Status.FLY:
				status = Status.STAND
		emit_signal("on_change_status", status)
		

func _process(delta):
	position += direction.normalized() * speed * delta
	position += vibration.normalized() * f * delta
	get_input()
	match status:
		Status.STAND:
			direction = Vector2(0, 0)
			vibration = Vector2(0, 0)
		
func calculate_direction(p: Vector2, d: Vector2, delta):
	var delta_p = (position - p).normalized()
	var cos_alpha = delta_p.normalized().dot(d.normalized())
	var sin_alpha = delta_p.normalized().cross(d.normalized())
	if cos_alpha > 0:
		if sin_alpha > 0:
			circle_direction = -1
		if sin_alpha < 0:
			circle_direction = 1
	var delta_c = circle_direction * Vector2(-delta_p.y, delta_p.x)
	direction = d
	vibration = delta_c
	
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
