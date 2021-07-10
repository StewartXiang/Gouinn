extends BaseEnemy

const MAX_SPEED = 500

# Declare member variables here. Examples:
# var a = 2

# Called when the node enters the scene tree for the first time.
func _ready():
	linear_damp = 1
	linear_velocity = Vector2(1, 1).normalized() * MAX_SPEED
	pass # Replace with function body.

func _process(delta):
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_dash():
	if target:
		linear_velocity = (target.get_global_transform().get_origin() - position).normalized() * MAX_SPEED
	else:
		linear_velocity = (Vector2(500, 500) - position).normalized() * MAX_SPEED
		
	pass # Replace with function body.

func look_follow(state, target_position: Vector2):
#	var _cos = transform.x.normalized().dot((target_position - position).normalized())
#	var _sin = transform.x.normalized().cross((target_position - position).normalized())
#	var j = 1
#	if _sin < 0:
#		j = -1
#	var _angle = acos(_cos)
	set_angular_velocity(get_angle_to(target_position) / state.get_step())
	
func _integrate_forces(state):
	if target:
		look_follow(state, target.get_global_transform().get_origin())
	else:
		look_follow(state, Vector2(0, 600))
