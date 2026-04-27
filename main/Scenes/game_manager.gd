extends Node

@export var main_menu_packed: PackedScene
@export var new_game_packed: PackedScene

func _ready() -> void:
	load_main_menu("game_start")

func load_main_menu(_origin: String):
	var main_menu: Control = main_menu_packed.instantiate()
	main_menu.new_game_pressed.connect(new_game)
	main_menu.load_game_pressed.connect(load_game_open)
	main_menu.settings_pressed.connect(settings_open)
	main_menu.exit_game_pressed.connect(exit_game)
	add_child(main_menu)
	
func new_game(origin: String):
	if origin == "main_menu":
		get_node("MainMenu").queue_free()
	var new_game: Node = new_game_packed.instantiate()
	add_child(new_game)
	
func load_game_open(_origin: String):
	pass
	
func settings_open(_origin: String):
	pass
	
func exit_game(_origin: String):
	get_tree().quit()
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
