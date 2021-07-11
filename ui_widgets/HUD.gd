extends CanvasLayer

var game_over = false

func update_score(score):
#	$ScoreLabel.text = "您已坚持 %s 秒" %str(score)
	$ScoreLabel.text = "　　　　 %s 　" %str(score)

func show_game_over(score):
	game_over = true
	$OverPanel/ScoreLabel.text = str(score)
	$OverPanel.visible = true


func _on_ClosedButton_pressed():
	get_tree().change_scene("res://ui_widgets/MainMenu.tscn")

func _input(event):
	if game_over:
		if event.is_action_pressed("pause") or event.is_action_pressed("ui_accept"):
			get_tree().change_scene("res://ui_widgets/MainMenu.tscn")
