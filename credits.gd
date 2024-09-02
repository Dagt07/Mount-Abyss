extends Control

@export var scroll_speed: float = 50.0

@export var menu_scene: PackedScene
@onready var credits_container: VBoxContainer = $VBoxContainer
@onready var back_to_menu: Button = %BackToMenu

var initial_position: float

func _ready() -> void:
	initial_position = size.y  
	credits_container.custom_minimum_size = Vector2(credits_container.custom_minimum_size.x, initial_position)
	credits_container.position.y = initial_position 
	back_to_menu.pressed.connect(_on_back_to_menu_pressed)
	
func _process(delta):
	credits_container.position.y -= scroll_speed * delta

	if credits_container.position.y + credits_container.size.y < 0:
		credits_container.position.y = initial_position

func _on_back_to_menu_pressed() -> void:
	get_tree().change_scene_to_packed(menu_scene)
	
