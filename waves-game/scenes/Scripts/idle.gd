extends State
class_name Idle

@onready var animated_sprite_2d: AnimatedSprite2D = %AnimatedSprite2D

func enter():
	animated_sprite_2d.play("idle")

func handle_input(_event: InputEvent):
	if Input.get_vector("left", "right", "up", "down"):
		state_machine.change_state("Walk")


func _on_player_player_dead() -> void:
	state_machine.change_state("not_alive")


func _on_player_player_hurt() -> void:
	state_machine.change_state("stunned")
