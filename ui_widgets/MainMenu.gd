extends Control

var Main = preload("res://RealMain.tscn")

func _on_NewButton_pressed():
	get_tree().change_scene_to(Main)

func _input(event):
	if event.is_action_pressed("pause") or event.is_action_pressed("ui_accept"):
		get_tree().change_scene_to(Main)


func _on_StoryButton_pressed():
	if $guide_panel.modulate.a == 1:
#		$AnimationPlayer.play_backwards("GuidePanel")
		$guide_panel.modulate.a = 0
	$AnimationPlayer.play("StoryPanel")
	


func _on_GuideButton_pressed():
	if $story_panel.modulate.a == 1:
#		$AnimationPlayer.play_backwards("StoryPanel")
		$story_panel.modulate.a = 0
	$AnimationPlayer.play("GuidePanel")
	
