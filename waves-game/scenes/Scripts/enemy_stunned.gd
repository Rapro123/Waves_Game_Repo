extends State
class_name enemy_stunned

@onready var stun_timer: Timer = $stun_timer
@onready var animated_sprite_2d: AnimatedSprite2D = %AnimatedSprite2D

@export var enemy = CharacterBody2D

func enter():
	animated_sprite_2d.play("hurt")
	enemy.velocity = Vector2.ZERO
	stun_timer.start()

func physics_update(_delta: float):
	pass
	

func _on_stun_timer_timeout() -> void:
	state_machine.change_state("chase")
