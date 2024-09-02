extends CharacterBody2D

@onready var hitbox: Hitbox = $Hitbox
#@onready var pop_sound: AudioStreamPlayer = $PopSound

func _ready() -> void:
	hitbox.damage_dealt.connect(_on_damage_dealt)


func take_damage(damage: int):
	Debug.log("ENEMY tank %d dmg" % damage)
	#pop_sound.play()
	queue_free()


func _on_damage_dealt() -> void:
	Debug.log("ENEMY HIT PLAYER")
