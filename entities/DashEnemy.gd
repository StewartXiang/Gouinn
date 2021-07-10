extends BaseEnemy


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var speed=20
var speed_range=Vector2(64,320)

# Called when the node enters the scene tree for the first time.
func _ready():
	speed=rand_range(speed_range.x,speed_range.y)
#	direction=Vector2(randf(),randf()).normalized()
	look_at(direction)
	direction = direction.normalized()

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func _physics_process(delta):
	position+=direction*delta*speed
