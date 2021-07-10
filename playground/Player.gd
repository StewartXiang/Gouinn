extends Area2D


signal hit

onready var tween = $Tween
onready var collision = $CollisionShape2D

export var speed = 400 # 角色移动速度（像素/秒） # export 允许在属性检查器中设置其值
var screen_size # 游戏窗口大小
var target = Vector2()
var on_rail = false


var path_follow



func _ready():
	screen_size = get_viewport_rect().size
	
	
func _process(delta):
	var velocity = Vector2()  
	
	if Input.is_action_pressed("ui_right"):
		velocity.x += 1
	if Input.is_action_pressed("ui_left"):
		velocity.x -= 1
	if Input.is_action_pressed("ui_down"):
		velocity.y += 1
	if Input.is_action_pressed("ui_up"):
		velocity.y -= 1
		
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed # velocity 其实只是速度的方向

		
	position += velocity * delta
#	position.x = clamp(position.x, 0, screen_size.x)
#	position.y = clamp(position.y, 0, screen_size.y)


	if on_rail: #在铁轨上走
		self.position = path_follow.position
		self.rotation_degrees = path_follow.rotation_degrees
		
		if path_follow.unit_offset == 1:
			on_rail = false
			$"../Path2D".queue_free()

	



func _on_Player_body_entered(body):
	print("被"+body.name+"撞了")
	on_rail = true
	
	path_follow = body.get_parent()
	
	if body.name == "HeadDetect":
		tween.interpolate_property(path_follow, "unit_offset", 0, 1, 10)
		$"../Path2D/PathFollow2DEnd".queue_free()
	elif body.name == "EndDetect":
		tween.interpolate_property(path_follow, "unit_offset", 1, 0, 10)
		$"../Path2D/PathFollow2DHead".queue_free()
	
	if not tween.is_active():
		tween.start()
	
	emit_signal("hit")


	
