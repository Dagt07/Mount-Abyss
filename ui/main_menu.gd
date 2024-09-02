extends Control

@onready var start_button: Button = %StartButton
@onready var world_levels_button: Button = %WorldLevelsButton
@onready var credits_button: Button = %CreditsButton
@onready var quit_button: Button = %QuitButton

@export var main = PackedScene
# recordar cambiar al final por el main_menu a la derecha en inspector de godot

func _ready() -> void:
	start_button.pressed.connect(_on_start_pressed)
	world_levels_button.pressed.connect(_on_levels_pressed)
	credits_button.pressed.connect(_on_credits_pressed)
	quit_button.pressed.connect(get_tree().quit)
	

func _on_start_pressed() -> void:
	get_tree().change_scene_to_packed(main)
	


func _on_levels_pressed() -> void:
	pass
	
	
func _on_credits_pressed() -> void:
	pass
	
