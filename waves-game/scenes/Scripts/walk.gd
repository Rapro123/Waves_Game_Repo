extends State
class_name Walk

const speed := 200
var direction: Vector2

@onready var animated_sprite_2d: AnimatedSprite2D = %AnimatedSprite2D

func enter():
	print("entering walk")

func physics_update(_delta: float) -> void:
	var character = state_machine.get_parent()
	
	direction.x = Input.get_axis("left", "right")
	direction.y = Input.get_axis("up", "down")
	
	direction = direction.normalized()
	
	if direction.x < 0:
		animated_sprite_2d.flip_h = true
	
	elif direction.x > 0:
		animated_sprite_2d.flip_h = false

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
