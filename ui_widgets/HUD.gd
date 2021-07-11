extends CanvasLayer

var game_over = false
var high=20

func update_score(score):
#	$ScoreLabel.text = "您已坚持 %s 秒" %str(score)
	$ScoreLabel.text = "　　　　 %s 　" %str(score)

func show_game_over(score):
	game_over = true
	$OverPanel/ScoreLabel.text = str(score)
	var basic_list=[$OverPanel/People,$OverPanel/Mob,$OverPanel/Firework]
	var high_list=[$OverPanel/PeopleUpTo15,$OverPanel/MobUpTo15,$OverPanel/FireworkUpTo15]
	if score<high:
		for i in basic_list: i.visible=true
		for i in high_list:  i.visible=false
	else:
		for i in basic_list: i.visible=false
		for i in high_list:  i.visible=true
	$OverPanel.visible = true
	var file = File.new()
	file.open("user://save_game.dat", File.READ)
	var best_score = int(file.get_as_text())
	file.close()	
	$OverPanel/HighScoreLabel.text = str(best_score)


func _on_ClosedButton_pressed():
	get_tree().change_scene("res://ui_widgets/MainMenu.tscn")

func _input(event):
	if game_over:
		if event.is_action_pressed("pause") or event.is_action_pressed("ui_accept"):
			get_tree().change_scene("res://ui_widgets/MainMenu.tscn")

func play_again():
	get_tree().change_scene("res://RealMain.tscn")

func quit_game():
	get_tree().quit()
	
func to720():
	OS.set_window_fullscreen(false)
	OS.set_window_size(Vector2(1280, 720))
	OS.center_window()

func to_full_screen():
	OS.set_window_fullscreen(true)
