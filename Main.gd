extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var gouinner = $Gouinner
onready var train = $Train

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _process(delta):
	train.calculate_direction(gouinner.position, delta)
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
