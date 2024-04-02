extends Control

@export_file("*.tscn") var game_scene: String

func _on_play_pressed():
	get_tree().change_scene_to_file(game_scene)


func _on_options_pressed():
	get_tree().change_scene_to_file("res://scenes/ui/OptionsMenu.tscn")


func _on_quit_pressed():
	get_tree().quit()
