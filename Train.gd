extends Carriage

signal hit
signal rail_entered
signal rail_exited

onready var tween = $Tween
onready var collision = $CollisionShape2D

var target = Vector2()
var on_rail = false


var path_follow
	
	
func _process(delta):
	if on_rail: #在铁轨上走
		print(path_follow)
		self.position = path_follow.position
		self.rotation_degrees = path_follow.rotation_degrees
		
		if path_follow.unit_offset >= 1:
			on_rail = false
			emit_signal("rail_exited")
			path_follow.get_parent().queue_free()


func _on_Train_body_entered(body):
	print("被"+body.name+"撞了")
	
	if body.name == "HeadDetect":
		path_follow = body.get_parent()
		print(path_follow)
		tween.interpolate_property(path_follow, "unit_offset", 0, 1, 5)
		path_follow.get_parent().get_node("PathFollow2DEnd").queue_free()
		on_rail = true
	elif body.name == "EndDetect":	
		path_follow = body.get_parent()
		tween.interpolate_property(path_follow, "unit_offset", 1, 0, 5)
		path_follow.get_parent().get_node("PathFollow2DHead").queue_free()
		on_rail = true
	
	if not tween.is_active():
		tween.start()
	
	emit_signal("hit")
	emit_signal("rail_entered")


