extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
const SHOWTIME:=0.7

var show_time:=SHOWTIME
var on_show:=false
var current_time:=0.0

onready var text_label:=$BG/Margin/Frame/Center/Text
onready var tween:=$Tween
onready var ani:=$BG/AnimationPlayer

signal on_show_end

# Called when the node enters the scene tree for the first time.
func _ready():
	yield(get_tree().create_timer(3.5),"timeout")
	dialog_pop_up()
	change_text("啊啊啊啊")
	yield(get_tree().create_timer(2*SHOWTIME),"timeout")
	change_text("哦哦哦哦哦哦哦哦哦哦哦哦哦")
	yield(get_tree().create_timer(2.1),"timeout")
	dialog_pop_off()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if on_show:
		current_time+=delta
		var p=current_time/show_time
		if p>=1.0:
			p=1.0
			on_show=false
			current_time=0.0
			self.emit_signal("on_show_end")
		text_label.percent_visible=p
		

func change_text(s: String,t:float=SHOWTIME):
	text_label.text=s
	text_label.percent_visible=0.0
	show_time=t
	current_time=0.0
	on_show=true
	
func dialog_pop_up():
	ani.play("pop_up")

func dialog_pop_off():
	ani.play_backwards("pop_up")

