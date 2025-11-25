extends State
class_name shooting_enemy_stunned

@onready var animated_sprite_2d: AnimatedSprite2D = %AnimatedSprite2D
@onready var stun_timer: Timer = $"stun timer"

func enter():
	animated_sprite_2d.play("hurt")
	stun_timer.start()
	

func _on_stun_timer_timeout() -> void:
	state_machine.change_state("shooting_enemy_idle")
