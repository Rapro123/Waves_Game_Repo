extends State
class_name stunned

@onready var animated_sprite_2d: AnimatedSprite2D = %AnimatedSprite2D
@onready var stun_timer: Timer = $"stun timer"
@onready var hurt_sound: AudioStreamPlayer2D = $"../../hurt sound"

var character_dead = false

func enter():
	var character = state_machine.get_parent()
	character.velocity = Vector2.ZERO
	
	stun_timer.start()
	
	hurt_sound.play()
	animated_sprite_2d.play("hurt")
	
func physics_update(_delta: float):
	pass

func _on_stun_timer_timeout() -> void:
	if !character_dead:
		state_machine.change_state("Idle")


func _on_player_player_dead() -> void:
	character_dead = true
	state_machine.change_state("not_alive")
