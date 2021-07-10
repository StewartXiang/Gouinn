extends Control


func _ready():
	for btn in $VBoxContainer.get_children():
		btn.connect("pressed", self, "on_pressed", [btn.name])
		
func on_pressed(name):
	match name:
		"NewButton":
			get_tree().change_scene("res://RealMain.tscn")
			
		"ScoreButton":
			var file = File.new()
			file.open("user://save_game.dat", File.READ)
			var best_score = int(file.get_as_text())
			file.close()
			
			$Panel/ScoreLabel.text = "High Score: " + str(best_score)
			$AnimationPlayer.play("Panel")
			
		"QuitButton":
			get_tree().quit()


func _on_ClosedButton_pressed():
	$AnimationPlayer.play_backwards("Panel")
