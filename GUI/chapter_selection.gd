extends Control

func _on_chapter_1_pressed():
	Autoload.spawn_to = "o1"
	get_tree().change_scene_to_file("res://World/world.tscn")
	


func _on_chapter_2_pressed():
	Autoload.spawn_to = "o2"
	get_tree().change_scene_to_file("res://World/world.tscn")


func _on_chapter_3_pressed():
	Autoload.spawn_to = "o3"
	get_tree().change_scene_to_file("res://World/world.tscn")
