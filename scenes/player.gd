class_name Player
extends CharacterBody2D


@export var speed = 400.0
@export var jump_speed = 500.0
@export var gravity = 800
@export var acceleration = 2000


@onready var sprite_2d: Sprite2D = $Pivot/Sonicsheetsonic
@onready var pivot: Node2D = $Pivot
@onready var hitbox: Hitbox = $Pivot/Hitbox
@onready var animation_tree: AnimationTree = $AnimationTree
@onready var playback = animation_tree.get("parameters/playback")


func _ready() -> void:
	hitbox.damage_dealt.connect(_on_damage_dealt)

# func _process(delta: float) -> void:
	# occurs in every frame of the game, associated with the monitor refresh rate
	# pass

func _physics_process(delta: float) -> void:
	# a optimization from not running at the optimal frame rate (it will try at least 60 per second)
	
	if not is_on_floor():
		velocity.y += gravity * delta
	
	
	var move_input = Input.get_axis("move_left", "move_right")
	velocity.x = move_toward(velocity.x, speed *  move_input, acceleration * delta)
	
	if is_on_floor() and Input.is_action_just_pressed("jump"):
		velocity.y = -jump_speed
		Debug.log("salte")
		
	if move_input != 0:
		pivot.scale.x = sign(move_input)
		
	if is_on_floor():
		if abs(velocity.x) > 10 or move_input:
			playback.travel("walk")
		else:
			playback.travel("idle")
	else:
		pass
		#if velocity.y < 0:
		#	playback.travel("jump")
		#else:
		#	playback.travel("fall")
	
	move_and_slide()

func taunt():
	Debug.log("· o ·)/")


func take_damage(damage: int):
	Debug.log("oh no")


func _on_damage_dealt() -> void:
	Debug.log("We made damage")
