extends CharacterBody2D

@onready var hitbox: Hitbox = $Hitbox
@onready var hurt_sound: AudioStreamPlayer = $Hurtbox/HurtSound

func _ready() -> void:
	hitbox.damage_dealt.connect(_on_damage_dealt)


func take_damage(damage: int):
	Debug.log("ENEMY tank %d dmg" % damage)
	hurt_sound.play()
	queue_free()


func _on_damage_dealt() -> void:
	Debug.log("ENEMY HIT PLAYER")
