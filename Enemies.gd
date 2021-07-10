extends Node2D

const EnermyKinds = [
	"CycloidEnemy", "CycloidEnemy", "CycloidEnemy", 
	"DashEnemy", "DashEnemy", "DashEnemy", 
	"BossEnemy",
	
]
const CYCLOID_ENERMY = preload("res://entities/CycloidEnemy.tscn")
const DASH_ENERMY = preload("res://entities/DashEnemy.tscn")
const BOSS_ENERMY = preload("res://entities/BossEnemy.tscn")
const PRELOADS = [
	preload("res://entities/CycloidEnemy.tscn"), 
	preload("res://entities/DashEnemy.tscn"), 
	preload("res://entities/BossEnemy.tscn"), 
]
# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var difficulty:float=0.1
var enemy_num = 0
var enemies_pool = [
	PRELOADS[0],
]
var main: Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	_start_enemies()
	pass # Replace with function body.

func _start_enemies():
	$Timer.start(3)
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Timer_timeout():
	for i in randi()%int(10*difficulty):
		spawn_enemy()
#	spawn_enemy()
	if enemy_num < PRELOADS.size()*4:
		enemies_pool.append(PRELOADS[min(randi()%int(enemy_num + 1), PRELOADS.size()-1)])
	difficulty += 0.5
	pass # Replace with function body.

func spawn_enemy():
	print(enemy_num)
	enemy_num += 1
	$Path2D/PathFollow2D.offset = randi()
	var _e = enemies_pool[randi()%enemies_pool.size()].instance()
	add_child(_e)
	_e.position = $Path2D/PathFollow2D.position
	var _degree = ($Path2D/PathFollow2D.rotation + PI/2 + rand_range(-PI / 4, PI / 4))
	_e.direction = Vector2(cos(_degree), sin(_degree))
	if main:
		print("...")
#		if main.status == main.Status.ManRotate:
#			_e.target = main.get_node("Gouinner")
#		else:
#			_e.target = main.get_node("Train")
		_e.target = main.get_node("Train")
	
	
	
