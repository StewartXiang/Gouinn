extends CanvasLayer


func update_score(score):
	$ScoreLabel.text = "已坚持秒数：" + str(score)

func show_game_over(score):
	$OverPanel/ScoreLabel.text = str(score)
	$OverPanel.visible = true


func _on_ClosedButton_pressed():
	get_tree().change_scene("res://ui_widgets/MainMenu.tscn")
