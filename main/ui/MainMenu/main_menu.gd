extends Control

signal new_game_pressed(origin: String)
signal load_game_pressed(origin: String)
signal settings_pressed(origin: String)
signal exit_game_pressed(origin: String)

func _on_new_game_button_pressed() -> void:
	new_game_pressed.emit("main_menu")


func _on_load_game_button_pressed() -> void:
	load_game_pressed.emit("main_menu")
	


func _on_settings_button_pressed() -> void:
	settings_pressed.emit("main_menu")


func _on_exit_game_button_pressed() -> void:
	exit_game_pressed.emit("main_menu")


func _on_fullscreen_toggled(button_pressed: bool) -> void:
	if button_pressed:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
	else:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
