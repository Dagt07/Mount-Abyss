extends Control

@onready var back_to_menu: Button = %BackToMenu

#@export var menu_scene: PackedScene

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	back_to_menu.pressed.connect(_on_back_to_menu_pressed)
	
	
func _on_back_to_menu_pressed() -> void:
	get_tree().change_scene_to_file("res://ui/main_menu.tscn")
