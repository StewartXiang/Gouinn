extends Node2D

const BASE_ENEMY = preload("res://entities/BaseEnemy.tscn")
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
	var _n = randi()%10 + 3
	for i in _n:
		var _b = BASE_ENEMY.instance()
		add_child(_b)
		_b.position = Vector2(
			randi()%1900 + 10, 
			randi()%1060 + 10
		)
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
	difficulty += 0.1
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
#		if main.status == main.Status.ManRotate:
#			_e.target = main.get_node("Gouinner")
#		else:
#			_e.target = main.get_node("Train")
		_e.target = main.get_node("Train")
	
	
	
