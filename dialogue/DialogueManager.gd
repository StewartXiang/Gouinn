extends Node2D

onready var dialogue = $Center

func first_of_all():
	# 最开始
	dialogue.dialog_pop_up()
	dialogue.change_text("又来了一个，看看你能坚持多久吧！", 5)
	yield(get_tree().create_timer(5),"timeout")
	dialogue.dialog_pop_off()

func death_once():
	# 死一次后
	dialogue.dialog_pop_up()
	dialogue.change_text("哈哈，每个人都会经历这个过程的", 5)
	yield(get_tree().create_timer(5),"timeout")
	dialogue.change_text("再挑战一次吧，JK 键可以帮助你调整绳子的半径。", 5)
	yield(get_tree().create_timer(5),"timeout")
	dialogue.dialog_pop_off()

func first_show_carriage():
	# 车厢出现后（此时不再出怪）
	dialogue.dialog_pop_up()
	dialogue.change_text("看，那里有一个车厢，它能延长你的生命。", 5)
	yield(get_tree().create_timer(5),"timeout")
	dialogue.dialog_pop_off()

func longest_rope():
	# 车厢出现后且玩家把绳子伸到了最长
	dialogue.dialog_pop_up()
	dialogue.change_text("哦吼吼，看来你需要一点新技巧，WASD 控制移动。", 5)
	yield(get_tree().create_timer(5),"timeout")
	dialogue.dialog_pop_off()
	
func first_get_carriage():
	# 终于拿到了车厢
	dialogue.dialog_pop_up()
	dialogue.change_text("被火车带着跑的感觉很不错吧。", 5)
	yield(get_tree().create_timer(5),"timeout")
	dialogue.dialog_pop_off()

func persist_20_seconds():
	# 坚持了 20s（彩蛋）
	dialogue.dialog_pop_up()
	dialogue.change_text("不知道你有没有听说过一款叫做《是男人就撑过20秒》的游戏。", 5)
	yield(get_tree().create_timer(5),"timeout")
	dialogue.change_text("但其实坚持 20 秒之后，什么都不会发生。", 5)
	yield(get_tree().create_timer(5),"timeout")
	dialogue.dialog_pop_off()

func first_show_rail():
	# 铁轨第一次出现
	dialogue.dialog_pop_up()
	dialogue.change_text("SSR！任何敌人都会被你撞飞，而且再也没有比这里车厢更多的地方了。", 8)
	yield(get_tree().create_timer(8),"timeout")
	dialogue.dialog_pop_off()

func enough_carriage():
	# 玩家攒够 n 节车厢后
	dialogue.dialog_pop_up()
	dialogue.change_text("看看我给你带来了些什么，铁轨！", 5)
	yield(get_tree().create_timer(5),"timeout")
	dialogue.dialog_pop_off()

func more_rails():
	# 玩家攒够 n 节车厢后
	dialogue.dialog_pop_up()
	dialogue.change_text("更多铁轨！", 5)
	yield(get_tree().create_timer(5),"timeout")
	dialogue.dialog_pop_off()

func too_many_rails():
	# 铁轨多到几乎用不完
	dialogue.dialog_pop_up()
	dialogue.change_text("你现在几乎什么都不用做，爽啦！", 5)
	yield(get_tree().create_timer(5),"timeout")
	dialogue.dialog_pop_off()

func resist():
	# 如果玩家按了一些其他按键
	dialogue.dialog_pop_up()
	dialogue.change_text("嗯？你刚刚是按了按键吗，我不是和你说过吗，你现在可以都不用做。", 8)
	yield(get_tree().create_timer(8),"timeout")
	dialogue.dialog_pop_off()

func resist2():
	# 如果玩家继续按
	dialogue.dialog_pop_up()
	dialogue.change_text("我不得不提醒你，如果你在铁轨上乱按的话，可能会出轨！", 5)
	yield(get_tree().create_timer(5),"timeout")
	dialogue.dialog_pop_off()

func resist3():
	# 玩家继续按
	dialogue.dialog_pop_up()
	dialogue.change_text("你怎么敢？！我给你带来了那么多铁轨，你却……", 5)
	yield(get_tree().create_timer(5),"timeout")
	dialogue.dialog_pop_off()

func resist4():
	# 玩家坚持
	dialogue.dialog_pop_up()
	dialogue.change_text("停下！停下！不要再按了，傻*！", 5)
	yield(get_tree().create_timer(5),"timeout")
	dialogue.dialog_pop_off()

func resist5():
	# 玩家还在按
	dialogue.dialog_pop_up()
	dialogue.change_text("不！！！！！！！！！！！！！", 5)
	yield(get_tree().create_timer(5),"timeout")
	dialogue.dialog_pop_off()
	
func _ready():
	first_of_all()
	yield(get_tree().create_timer(5),"timeout")
	death_once()
	yield(get_tree().create_timer(5),"timeout")
	first_show_carriage()
	yield(get_tree().create_timer(5),"timeout")
	longest_rope()
	yield(get_tree().create_timer(5),"timeout")
	first_get_carriage()
	yield(get_tree().create_timer(5),"timeout")
	persist_100_seconds()
	yield(get_tree().create_timer(5),"timeout")
	first_show_rail()
	yield(get_tree().create_timer(5),"timeout")
	enough_carriage()
	yield(get_tree().create_timer(5),"timeout")
	more_rails()
	yield(get_tree().create_timer(5),"timeout")
	too_many_rails()
	yield(get_tree().create_timer(5),"timeout")
	resist()
	yield(get_tree().create_timer(5),"timeout")
	resist2()
	yield(get_tree().create_timer(5),"timeout")
	resist3()
	yield(get_tree().create_timer(5),"timeout")
	resist4()
	yield(get_tree().create_timer(5),"timeout")
	resist5()
