extends Node2D


var client = StreamPeerTCP.new()


func _ready():
	client.connect_to_host('127.0.0.1',8096)
	if client.is_connected_to_host():
		client.put_data('SetWallpaper'.to_utf8())

func _exit_tree():
	client.disconnect_from_host()
