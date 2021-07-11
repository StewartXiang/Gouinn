extends BaseItem


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _on_pickup(owner:Node2D):
	visible=false
	var train=owner.get("train")
	if not train:
		train=owner.get_node("Train")
	if train is Carriage:
		owner.call_deferred("add_carriage", position)
#		var one=owner.add_carriage(position)
#		one.rotation=rotation
	._on_pickup(owner)
