extends State
class_name Walk

const speed := 200
var direction: Vector2

@onready var animated_sprite_2d: AnimatedSprite2D = %AnimatedSprite2D
@onready var footsteps: AudioStreamPlayer2D = %footsteps
@onready var footsteps_timer: Timer = $footsteps_timer

func enter():
	animated_sprite_2d.play("run")

func physics_update(_delta: float) -> void:
	play_footseps()
	
	var character = state_machine.get_parent()
	
	direction.x = Input.get_axis("left", "right")
	direction.y = Input.get_axis("up", "down")
	
	direction = direction.normalized()

	if direction == Vector2.ZERO:
		state_machine.change_state("Idle")

	if direction:
		character.velocity = direction * speed
	
	else:
		character.velocity = character.velocity.move_toward(Vector2.ZERO, speed)
	
	character.move_and_slide()


func _on_player_player_dead() -> void:
	state_machine.change_state("not_alive")


func _on_player_player_hurt() -> void:
	state_machine.change_state("stunned")


func play_footseps():
	if footsteps_timer.is_stopped():
		footsteps_timer.start()


func _on_footsteps_timer_timeout() -> void:
	footsteps.play()
