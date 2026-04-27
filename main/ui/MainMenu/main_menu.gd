extends Control

const SAVE_SELECT_MENU_SCENE := "res://main/UI/PlayMenu/SaveSelectMenu.tscn"
const SETTINGS_MENU_SCENE := "res://main/UI/SettingsMenu/SettingsMenu.tscn"

@onready var play_button: BaseButton = %PlayButton
@onready var settings_button: BaseButton = %SettingsButton
@onready var exit_button: BaseButton = %ExitButton
@onready var exit_confirm_dialog: ConfirmationDialog = %ExitConfirmDialog

func _ready() -> void:
	play_button.pressed.connect(_on_play_pressed)
	settings_button.pressed.connect(_on_settings_pressed)
	exit_button.pressed.connect(_on_exit_pressed)
	exit_confirm_dialog.confirmed.connect(_on_exit_confirmed)

func _on_play_pressed() -> void:
	get_tree().change_scene_to_file(SAVE_SELECT_MENU_SCENE)

func _on_settings_pressed() -> void:
	get_tree().change_scene_to_file(SETTINGS_MENU_SCENE)

func _on_exit_pressed() -> void:
	exit_confirm_dialog.popup_centered()

func _on_exit_confirmed() -> void:
	get_tree().quit()
