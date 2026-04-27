#extends Control
#
#signal new_game_pressed(origin: String)
#signal load_game_pressed(origin: String)
#signal settings_pressed(origin: String)
#signal exit_game_pressed(origin: String)
#
#func _on_new_game_button_pressed() -> void:
	#new_game_pressed.emit("main_menu")
#
#
#func _on_load_game_button_pressed() -> void:
	#load_game_pressed.emit("main_menu")
	#
#
#
#func _on_settings_button_pressed() -> void:
	#settings_pressed.emit("main_menu")
#
#
#func _on_exit_game_button_pressed() -> void:
	#exit_game_pressed.emit("main_menu")
#
#
#func _on_fullscreen_toggled(button_pressed: bool) -> void:
	#if button_pressed:
		#DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
	#else:
		#DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
extends Control

@onready var fullscreen_check: CheckButton = %FullscreenCheck
@onready var windowed_720_button: BaseButton = %Windowed720Button
@onready var minimize_button: BaseButton = %MinimizeButton
@onready var resolution_label: Label = %ResolutionLabel

func _ready() -> void:
	print("MainMenu ready")

	print(fullscreen_check)
	print(windowed_720_button)
	print(minimize_button)
	print(resolution_label)

	fullscreen_check.button_pressed = ResolutionManager.is_fullscreen()

	fullscreen_check.toggled.connect(_on_fullscreen_toggled)
	windowed_720_button.pressed.connect(_on_windowed_720_pressed)
	minimize_button.pressed.connect(_on_minimize_pressed)

	get_viewport().size_changed.connect(_update_resolution_label)
	_update_resolution_label()

func _on_fullscreen_toggled(enabled: bool) -> void:
	print("Fullscreen toggled: ", enabled)
	ResolutionManager.set_fullscreen(enabled)
	_update_resolution_label()

func _on_windowed_720_pressed() -> void:
	print("Windowed 720 pressed")
	ResolutionManager.set_windowed_720p()
	fullscreen_check.button_pressed = false
	_update_resolution_label()

func _on_minimize_pressed() -> void:
	print("Minimize pressed")
	ResolutionManager.minimize_to_taskbar()

func _update_resolution_label() -> void:
	var window: Window = get_window()
	resolution_label.text = "Window: %s | Base: %s | Min: %s" % [
		window.size,
		window.content_scale_size,
		window.min_size
	]
