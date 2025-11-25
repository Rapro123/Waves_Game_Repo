extends State
class_name idle

@onready var animated_sprite_2d: AnimatedSprite2D = %AnimatedSprite2D

func enter():
	animated_sprite_2d.play("idle")
	

func _on_shooting_enemy_shooting_enemy_hurt() -> void:
	state_machine.change_state("shooting_enemy_stunned")
