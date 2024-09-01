extends CanvasLayer
@onready var resume_button: Button = %ResumeButton
@onready var menu_button: Button = %MenuButton
@onready var quit_button: Button = %QuitButton


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	resume_button.pressed.connect(_on_resume_button_pressed)
	menu_button.pressed.connect(_on_menu_button_pressed)
	quit_button.pressed.connect(get_tree().quit)
	hide()

func _input(event: InputEvent) -> void:
	# Allows for pausing and unpausing with menu key input
	if event.is_action_pressed("menu"):
		visible = not visible
		get_tree().paused = visible


func _on_resume_button_pressed() -> void:
	hide()
	get_tree().paused = false


func _on_menu_button_pressed() -> void:
	get_tree().paused = false
	get_tree().change_scene_to_file("res://ui/main_menu.tscn")
	#LevelManager.go_to_menu()
