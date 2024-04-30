extends Control

func _on_play_pressed():
	GameState.start_game()


func _on_options_pressed():
	GameState.open_settings()


func _on_quit_pressed():
	get_tree().quit()
