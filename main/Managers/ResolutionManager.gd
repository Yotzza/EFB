extends Node
## Godot 4.x fullscreen/resolution helper.
## Add this as an Autoload named ResolutionManager.
##
##                   NE DIRAJ
##                NE MENJAJ NISTA
##              DON'T TOUCH ANYTHING
##           DON'T CHANGE ANYTHING HERE
##

const BASE_DESIGN_SIZE: Vector2i = Vector2i(1920, 1080)
const MIN_WINDOW_SIZE: Vector2i = Vector2i(1280, 720)
const START_FULLSCREEN: bool = true

func _ready() -> void:
	apply_resolution_settings()
	var window: Window = get_window()
	if not window.size_changed.is_connected(_on_window_size_changed):
		window.size_changed.connect(_on_window_size_changed)
	if START_FULLSCREEN:
		set_fullscreen(true)
	else:
		set_windowed_720p()

func apply_resolution_settings() -> void:
	var window: Window = get_window()

	# Good default for most 2D games/UI. For pixel art, see notes in the guide.
	window.content_scale_mode = Window.CONTENT_SCALE_MODE_CANVAS_ITEMS

	# Preserves aspect ratio and uses extra space on ultrawide/tall displays.
	# Use CONTENT_SCALE_ASPECT_KEEP instead if you prefer black bars.
	window.content_scale_aspect = Window.CONTENT_SCALE_ASPECT_EXPAND
	window.content_scale_stretch = Window.CONTENT_SCALE_STRETCH_FRACTIONAL
	window.content_scale_factor = 1.0
	_update_content_scale_size(window)

	# Prevents dragging below 720p on normal 720p+ monitors.
	# On smaller screens, it relaxes just enough to keep the window visible.
	window.min_size = _safe_windowed_size(MIN_WINDOW_SIZE)
	window.unresizable = false

func is_fullscreen() -> bool:
	var mode: int = get_window().mode
	return mode == Window.MODE_FULLSCREEN or mode == Window.MODE_EXCLUSIVE_FULLSCREEN

func toggle_fullscreen() -> void:
	set_fullscreen(not is_fullscreen())

func set_fullscreen(enabled: bool) -> void:
	if enabled:
		get_window().mode = Window.MODE_EXCLUSIVE_FULLSCREEN
	else:
		set_windowed_720p()

func set_windowed_720p() -> void:
	var window: Window = get_window()
	var safe_size: Vector2i = _safe_windowed_size(MIN_WINDOW_SIZE)
	window.mode = Window.MODE_WINDOWED
	window.min_size = safe_size
	window.size = safe_size
	window.move_to_center()

func minimize_to_taskbar() -> void:
	# This is OS minimization: the game is hidden in the taskbar/dock.
	# It is different from "resizing the window down to 720p".
	get_window().mode = Window.MODE_MINIMIZED

func _on_window_size_changed() -> void:
	_update_content_scale_size(get_window())

func _safe_windowed_size(desired_size: Vector2i) -> Vector2i:
	var screen: int = DisplayServer.window_get_current_screen()
	var usable_rect: Rect2i = DisplayServer.screen_get_usable_rect(screen)
	var usable_size: Vector2i = usable_rect.size

	if desired_size.x <= usable_size.x and desired_size.y <= usable_size.y:
		return desired_size

	var scale_x: float = float(usable_size.x) / float(desired_size.x)
	var scale_y: float = float(usable_size.y) / float(desired_size.y)
	var scale: float = min(scale_x, scale_y)
	return Vector2i(max(1, int(desired_size.x * scale)), max(1, int(desired_size.y * scale)))

func _update_content_scale_size(window: Window) -> void:
	var width_ratio: float = float(window.size.x) / float(BASE_DESIGN_SIZE.x)
	var height_ratio: float = float(window.size.y) / float(BASE_DESIGN_SIZE.y)
	var scale_cap: float = max(1.0, min(width_ratio, height_ratio))
	window.content_scale_size = Vector2i(
		int(round(BASE_DESIGN_SIZE.x * scale_cap)),
		int(round(BASE_DESIGN_SIZE.y * scale_cap))
	)
