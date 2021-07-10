extends Area2D

const speed = 600
# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var direction = Vector2(1, 0)



# Called when the node enters the scene tree for the first time.
func _ready():
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position += direction.normalized() * speed * delta
	pass
#	pass

func calculate_direction(p: Vector2, delta):
	var delta_d = (position - p).normalized()
	var _cos = direction.normalized().dot(delta_d)
	var _sin = direction.normalized().cross(delta_d)
	var side
	if _sin >= 0:
		side = 1
	if _sin < 0:
		side = -1
	direction += (delta_d * speed * (-_cos) * delta)
	direction = direction.normalized()
	var _direction_sin = Vector2(1, 0).cross(direction)
	var _direction_cos = Vector2(1, 0).dot(direction)
#	print(asin(_sin))
	look_at(position + direction)
#	print(direction)
