extends Control

const MAIN_MENU_SCENE := "res://main/UI/MainMenu/MainMenu.tscn"

@onready var save_slot_1_button: BaseButton = %SaveSlot1Button
@onready var save_slot_2_button: BaseButton = %SaveSlot2Button
@onready var save_slot_3_button: BaseButton = %SaveSlot3Button
@onready var save_slot_4_button: BaseButton = %SaveSlot4Button

@onready var save_slot_1_label: Label = %SaveSlot1Label
@onready var save_slot_2_label: Label = %SaveSlot2Label
@onready var save_slot_3_label: Label = %SaveSlot3Label
@onready var save_slot_4_label: Label = %SaveSlot4Label

@onready var delete_slot_1_button: BaseButton = %DeleteSlot1Button
@onready var delete_slot_2_button: BaseButton = %DeleteSlot2Button
@onready var delete_slot_3_button: BaseButton = %DeleteSlot3Button
@onready var delete_slot_4_button: BaseButton = %DeleteSlot4Button

@onready var back_button: BaseButton = %BackButton
@onready var delete_confirm_dialog: ConfirmationDialog = %DeleteConfirmDialog

var delete_target_slot: int = -1

var save_slots := [
	"user://save_slot_1.save",
	"user://save_slot_2.save",
	"user://save_slot_3.save",
	"user://save_slot_4.save"
]

func _ready() -> void:
	save_slot_1_button.pressed.connect(_on_save_slot_pressed.bind(0))
	save_slot_2_button.pressed.connect(_on_save_slot_pressed.bind(1))
	save_slot_3_button.pressed.connect(_on_save_slot_pressed.bind(2))
	save_slot_4_button.pressed.connect(_on_save_slot_pressed.bind(3))

	delete_slot_1_button.pressed.connect(_on_delete_slot_pressed.bind(0))
	delete_slot_2_button.pressed.connect(_on_delete_slot_pressed.bind(1))
	delete_slot_3_button.pressed.connect(_on_delete_slot_pressed.bind(2))
	delete_slot_4_button.pressed.connect(_on_delete_slot_pressed.bind(3))

	back_button.pressed.connect(_on_back_pressed)
	delete_confirm_dialog.confirmed.connect(_on_delete_confirmed)

	_update_save_slot_buttons()


func _update_save_slot_buttons() -> void:
	var save_labels := [
		save_slot_1_label,
		save_slot_2_label,
		save_slot_3_label,
		save_slot_4_label
	]

	var delete_buttons := [
		delete_slot_1_button,
		delete_slot_2_button,
		delete_slot_3_button,
		delete_slot_4_button
	]

	for i in range(4):
		var save_exists := FileAccess.file_exists(save_slots[i])

		if save_exists:
			save_labels[i].text = "Slot %d - Continue" % [i + 1]
			delete_buttons[i].disabled = false
			delete_buttons[i].visible = true
		else:
			save_labels[i].text = "Slot %d - New Game" % [i + 1]
			delete_buttons[i].disabled = true
			delete_buttons[i].visible = false


func _on_save_slot_pressed(slot_index: int) -> void:
	if FileAccess.file_exists(save_slots[slot_index]):
		print("Continue slot ", slot_index + 1)
	else:
		print("Create new save in slot ", slot_index + 1)
		_create_new_save(slot_index)

	# Later replace this with your gameplay scene.
	# get_tree().change_scene_to_file("res://scenes/game/Game.tscn")


func _create_new_save(slot_index: int) -> void:
	var save_data := {
		"slot": slot_index + 1,
		"created": Time.get_datetime_string_from_system(),
		"progress": 0
	}

	var file := FileAccess.open(save_slots[slot_index], FileAccess.WRITE)
	file.store_var(save_data)
	file.close()

	_update_save_slot_buttons()


func _on_delete_slot_pressed(slot_index: int) -> void:
	if not FileAccess.file_exists(save_slots[slot_index]):
		return

	delete_target_slot = slot_index
	delete_confirm_dialog.dialog_text = "Are you sure you want to delete Slot %d?" % [slot_index + 1]
	delete_confirm_dialog.popup_centered()


func _on_delete_confirmed() -> void:
	if delete_target_slot == -1:
		return

	if FileAccess.file_exists(save_slots[delete_target_slot]):
		DirAccess.remove_absolute(save_slots[delete_target_slot])
		print("Deleted slot ", delete_target_slot + 1)

	delete_target_slot = -1
	_update_save_slot_buttons()


func _on_back_pressed() -> void:
	get_tree().change_scene_to_file(MAIN_MENU_SCENE)
