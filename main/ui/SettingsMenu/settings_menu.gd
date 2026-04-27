extends Control

const MAIN_MENU_SCENE := "res://main/UI/MainMenu/MainMenu.tscn"

@onready var fullscreen_check: CheckButton = %FullscreenCheck
@onready var music_slider: HSlider = %MusicSlider
@onready var sfx_slider: HSlider = %SfxSlider
@onready var back_button: BaseButton = %BackButton

func _ready() -> void:
	fullscreen_check.button_pressed = ResolutionManager.is_fullscreen()

	fullscreen_check.toggled.connect(_on_fullscreen_toggled)
	music_slider.value_changed.connect(_on_music_changed)
	sfx_slider.value_changed.connect(_on_sfx_changed)
	back_button.pressed.connect(_on_back_pressed)

func _on_fullscreen_toggled(enabled: bool) -> void:
	ResolutionManager.set_fullscreen(enabled)

func _on_music_changed(value: float) -> void:
	print("Music volume: ", value)

func _on_sfx_changed(value: float) -> void:
	print("SFX volume: ", value)

func _on_back_pressed() -> void:
	get_tree().change_scene_to_file(MAIN_MENU_SCENE)
