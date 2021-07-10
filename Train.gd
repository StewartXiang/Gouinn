extends Area2D

const speed = 200
# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var direction = Vector2(1, 0)



# Called when the node enters the scene tree for the first time.
func _ready():
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	position += direction.normalized() * speed * delta
	pass
#	pass

func calculate_direction(p: Vector2, delta):
	var delta_d = (position - p).normalized()
	var _cos = direction.normalized().dot(delta_d)
	print(_cos)
	direction += (delta_d *  (-_cos))
	direction = direction.normalized()
	#print(direction)
#	print(asin(_sin))
	look_at(position + direction)
#	print(direction)
