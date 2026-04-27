extends CharacterBody2D

@export var speed: float = 220.0

func _physics_process(_delta: float) -> void:
	var input_direction := Input.get_vector(
		"move_left",
		"move_right",
		"move_up",
		"move_down"
	)

	velocity = input_direction * speed
	move_and_slide()
	

#char model rotate by mouse position

@onready var body: Sprite2D = $Body
@onready var head: Sprite2D = $Head

var body_textures = {
	"up": preload("res://main/art/playerBody/4.png"),
	"down": preload("res://main/art/playerBody/1.png"),
	"left": preload("res://main/art/playerBody/3.png"),
	"right": preload("res://main/art/playerBody/2.png")
}

var head_textures = {
	"up": preload("res://main/art/playerHead/head1up.png"),
	"down": preload("res://main/art/playerHead/head1down.png"),
	"left": preload("res://main/art/playerHead/head1left.png"),
	"right": preload("res://main/art/playerHead/head1right.png")
}

func set_direction(dir: String):
	$Sprite2D2.texture = body_textures[dir]
	$Sprite2D.texture = head_textures[dir]

func update_sprites(dir: Vector2):
	if abs(dir.x) > abs(dir.y):
		# LEFT / RIGHT
		if dir.x > 0:
			set_direction("right")
		else:
			set_direction("left")
	else:
		# UP / DOWN
		if dir.y > 0:
			set_direction("down")
		else:
			set_direction("up")

func _process(delta):
	var mouse_pos = get_global_mouse_position()
	var dir = (mouse_pos - global_position).normalized()

	update_sprites(dir)
	
	
