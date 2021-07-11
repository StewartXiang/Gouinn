extends Node2D

var score

func _ready():
	randomize()
	new_game()
	
	$Enemies.main = $Main


func new_game():
	score = 0
	$HUD.update_score(score)
	$ScoreTimer.start()
	$BGM.play()
	




func game_over():
	$ScoreTimer.stop()
	save_best_score()
	$HUD.show_game_over(score)
	$BGM.stop()
	

func _on_ScoreTimer_timeout():
	score += 1
	$HUD.update_score(score)


func save_best_score():
	var best_score = 0
	var file = File.new()
	
	file.open("user://save_game.dat", File.READ)
	best_score = int(file.get_as_text())
	file.close()
	
	if score > best_score:
		file.open("user://save_game.dat", File.WRITE)
		file.store_string(str(score))
		file.close()



func gameover():
	game_over()
	pass # Replace with function body.
