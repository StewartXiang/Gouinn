extends Node2D
enum Status{ManRotate=0, TrainRotate=1}

var r=200
var w=180
var v=deg2rad(w)*r/2.0
onready var gouinner = $Gouinner
onready var train = $Train
var status = Status.ManRotate
var current_deg=0.0
var src=Vector2.ZERO
var tar=Vector2.ONE
var man_range=Vector2(-45,45)
var clockwise=-1
# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var carriage=preload("res://Carriage.tscn")

func get_input():
	if Input.is_action_just_pressed("space"):
		status=1-status
		match status:
			Status.ManRotate:
				src=train.position
				current_deg=rad2deg( (gouinner.position-train.position).angle() )
				v=deg2rad(w)*r/2.0
				train.get_node("AnimatedSprite").animation = "stright"
				gouinner.get_node("AnimatedSprite").animation = "stright"
			Status.TrainRotate:
				src=gouinner.position
				current_deg=rad2deg( (train.position-gouinner.position).angle() )
				var rvec=train.position-gouinner.position
				clockwise=sign(rvec.dot(-train.transform.y) )
				train.get_node("AnimatedSprite").animation = "circle"
				gouinner.get_node("AnimatedSprite").animation = "circle"
	if Input.is_action_just_pressed("ui_up"):
		var one=carriage.instance()
		add_child(one)
		var last=train
		while last.tail_node:
			last=last.tail_node
		one.setup(last)

# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
#	src=gouinner.position
	src = train.position
	var rvec=train.position-gouinner.position
	clockwise=sign(rvec.dot(-train.transform.y) )
	

func _physics_process(delta):
	get_input()
	current_deg+=w*delta*clockwise
	current_deg=fmod(current_deg,360.0)
	var rvec=r*deg2vec(current_deg)
	var train_vec=train.transform.x
	var tvec=rvec.tangent() * clockwise
	tar=src+rvec
	match status:
		Status.ManRotate:
			var man_to_train=rad2deg((-rvec).angle_to(train_vec))
#			print(man_to_train)
			if ((man_to_train<=man_range.x and clockwise==1) or 
			(man_to_train>=man_range.y and clockwise==-1)):
				clockwise*=-1
				current_deg+=w*delta*clockwise
			gouinner.position=tar
			var group_move=train_vec*v*delta
			src+=group_move
			train.position+=group_move
			gouinner.rotation=deg2rad(current_deg+180)
		Status.TrainRotate:
			train.position=tar
			train.rotation=(-tvec).angle()
			gouinner.rotation=deg2rad(current_deg)
	update()

#func _draw():
#	var rvec=r*deg2vec(current_deg)
#	var tvec=rvec.tangent() * clockwise
#	var train_vec=train.transform.x
#	draw_line(src,src+rvec,Color.red)
#	draw_line(src+rvec,src+rvec+tvec,Color.blue)
#	draw_line(train.position,train.position+train_vec*10,Color.aqua)
	#draw_line(train.position,train.position+train.transform.y*100,Color.aqua)
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func deg2vec(deg:float) -> Vector2:
	return Vector2.RIGHT.rotated(deg2rad(deg))
