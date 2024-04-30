extends Node

enum States { MainMenu, SettingsMenu, MainGame, PauseMenu }
var currentGameState := States.MainMenu

var scenes = {
	States.MainMenu: "res://scenes/ui/MainMenu.tscn",
	States.SettingsMenu: "res://scenes/ui/OptionsMenu.tscn",
	States.MainGame: "res://scenes/game_world.tscn",
	States.PauseMenu: "res://scenes/ui/pause_menu.tscn"
}

func _ready():
	switch_state(States.MainMenu)

func switch_state(new_state: States) -> void:
	currentGameState = new_state
	get_tree().change_scene_to_file(scenes[new_state])

# Example transition functions
func start_game():
	switch_state(States.MainGame)

func open_settings():
	switch_state(States.SettingsMenu)

func resume_game():
	switch_state(States.MainGame)
