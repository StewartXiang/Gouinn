extends RigidBody2D
class_name BaseEnemy
var visiualer
var direction = Vector2(1, 0)

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var life = 0
var target: Area2D

func _enter_tree():
	visiualer = VisibilityNotifier2D.new()
	add_child(visiualer, true)

# Called when the node enters the scene tree for the first time.
func _ready():
	$VisibilityNotifier2D.connect("screen_exited", self, "_on_VisibilityNotifier2D_screen_exited")
	collision_mask = 0b0
	gravity_scale = 0
	pass

func _physics_process(delta):
	life += delta
	pass
	
func _on_VisibilityNotifier2D_screen_exited():
	print("s.fdsf")
	queue_free()

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
