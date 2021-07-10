extends Control


func _ready():
	for btn in $VBoxContainer.get_children():
		btn.connect("pressed", self, "on_pressed", [btn.name])
		
func on_pressed(name):
	match name:
		"NewButton":
			get_tree().change_scene("res://RealMain.tscn")
		"ScoreButton":
			print("分数榜")
		"QuitButton":
			get_tree().quit()
