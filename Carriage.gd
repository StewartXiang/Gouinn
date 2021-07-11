extends Area2D
class_name Carriage

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
const Offset=20
const DistanceThreshold=10.0
const StepSpeed=1/0.4 # 0.4s内
const MaxAngle=130
const MaxFollowSpeed=50

var head_node:Node2D=null
var tail_node:Node2D=null
var body_vec:Vector2
#var src_pos=Vector2.ZERO
var tar_vec=Vector2.ZERO
#var current_step=-1.0

onready var shape=$CollisionShape2D
signal gameover

# Called when the node enters the scene tree for the first time.
func _ready():
	var capsule=shape.shape
	body_vec=Vector2.RIGHT*(capsule.radius+capsule.height/2.0+Offset)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _physics_process(delta):
	if head_node:
		var tail_pos=head_node.get_tail_pos()
		var head_pos=get_head_pos()
#		position=tail_pos-(body_vec).rotated(rotation)
		var angle=(-transform.x).angle_to(head_node.transform.x)
		var max_angle=deg2rad(MaxAngle)
		if abs(angle)<max_angle:
			transform.x=head_node.transform.x.rotated(PI-sign(angle)*max_angle)
		var distance=head_pos.distance_to(tail_pos)
#		var tar_pos=tail_pos-(body_vec).rotated(rotation)
#		position+=(tar_pos-position)*move_toward(0.0,1.0,max(0.03,distance/DistanceThreshold))
		if distance>DistanceThreshold:
			tar_vec=tail_pos-head_pos
			position+=tar_vec.normalized()*MaxFollowSpeed*max(1.2,distance/DistanceThreshold)*delta			
#			if current_step>=0:
#				tar_vec=tail_pos-head_pos
#				current_step+=StepSpeed*delta*max(1.2,distance/DistanceThreshold)
#				position+=tar_vec*lerp(0.0,1.0,current_step)
#				position+=tar_vec.normalized()*50*max(1.2,distance/DistanceThreshold)*delta
#				if current_step>=1:
#					end_following()
#			else:
#				start_following(head_pos,tail_pos,distance)
#		else:
#			if current_step>=0:
#				end_following()

func setup(h:Carriage):
	head_node=h
	h.tail_node=self
	connect("body_entered",get_parent(),"_on_body_entered")

func dropout():
	if head_node == null:
		emit_signal("gameover")
	else:
		head_node.tail_node.get_node("AnimationPlayer").play("blink")
		yield(get_tree().create_timer(0.3),"timeout")
		head_node.tail_node.queue_free()
		head_node.tail_node=null
		head_node=null
		disconnect("body_entered",get_parent(),"_on_body_entered")

func get_head_pos()-> Vector2:
	return shape.global_position+body_vec.rotated(rotation)
	
func get_tail_pos()-> Vector2:
	return shape.global_position+(-body_vec).rotated(rotation)

#func start_following(head_pos:Vector2,tail_pos:Vector2,distance:float):
#	tar_vec=tail_pos-head_pos
#	current_step=0.0
#	src_pos=position
#
#func end_following():
#	current_step=-1.0
#	src_pos=Vector2.ZERO
#	tar_vec=Vector2.ZERO
#func _draw():
#
##	draw_circle(Vector2.ZERO,10,Color.red)
#	draw_circle(body_vec.rotated(rotation),10,Color.red)
#	draw_circle((-body_vec).rotated(rotation),30,Color.blue)
#	draw_line(Vector2.ZERO,body_vec,Color.aqua)

static func get_last(c:Carriage)-> Carriage:
	var last:Carriage=c
	while last.tail_node:
		last=last.tail_node
	return last
		
