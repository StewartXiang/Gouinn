extends CanvasLayer


func update_score(score):
	$ScoreLabel.text = "已坚持秒数：" + str(score)
