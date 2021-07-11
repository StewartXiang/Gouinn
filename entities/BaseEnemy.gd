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
	collision_mask = 0b00000000000000000100
	collision_layer = 0b00000000000000000101
	gravity_scale = 0
	contact_monitor = true
	contacts_reported = 5
	connect("body_entered", self, "_on_hit")
	pass

func _physics_process(delta):
	life += delta
	pass
	
func _on_VisibilityNotifier2D_screen_exited():
	queue_free()

func _on_hit(body):
	pass

func _destroy():
	hide()
	$CollisionShape2D.set_deferred("disabled", true)
	queue_free()

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
