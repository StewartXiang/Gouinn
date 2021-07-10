extends Node2D
enum Status{STRAIGHT, CIRCLE}

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var status

onready var gouinner = $Gouinner
onready var train = $Train

# Called when the node enters the scene tree for the first time.
func _ready():
	status = Status.CIRCLE
	pass # Replace with function body.

func _process(delta):
	match status:
		Status.STRAIGHT:
			pass
		Status.CIRCLE:
			rotate(0.2*delta*PI)
			pass
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
