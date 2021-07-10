extends Node2D
enum Status{STRAIGHT, CIRCLE}

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var gouinner = $Gouinner
onready var train = $Train
var status = Status.STRAIGHT

# Called when the node enters the scene tree for the first time.
func _ready():
	
	pass # Replace with function body.

func _physics_process(delta):
	match status:
		Status.STRAIGHT:
			gouinner.calculate_direction(train.position, train.direction, delta)
			pass
		Status.CIRCLE:
			train.calculate_direction(gouinner.position, delta)
	pass
	
func change_status(s):
	status = s
	match s:
		Status.STRAIGHT:
			pass
		Status.CIRCLE:
			pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
