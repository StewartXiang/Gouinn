extends Control

func _input(event):
	if event.is_action_pressed("pause"):
		pause_game()

func pause_game():
	get_tree().paused = not get_tree().paused
	self.visible = not self.visible

func _on_ResumeButton_pressed():
	pause_game()
