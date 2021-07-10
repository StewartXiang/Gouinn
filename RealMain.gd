extends Node2D

var score

func _ready():
	new_game()
	$Enemies.main = $Main


func new_game():
	score = 0
	$HUD.update_score(score)
	$ScoreTimer.start()


func game_over():
	$ScoreTimer.stop()

func _on_ScoreTimer_timeout():
	score += 1
	$HUD.update_score(score)


