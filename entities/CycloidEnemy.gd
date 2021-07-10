extends BaseEnemy


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var speed
var force = Vector2(0, 0)


# Called when the node enters the scene tree for the first time.
func _ready():
	speed = randi() % 150 + 50
	position = Vector2(800, 500)
	pass # Replace with function body.

func _physics_process(delta):
	force = direction.rotated(0.5*PI).normalized() * delta * speed * (cos(life)+1) * (cos(life)+1) * (cos(life)+1) * (cos(life)+1) * 0.02
	direction += force
	position += direction.normalized() * speed * delta
	
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
