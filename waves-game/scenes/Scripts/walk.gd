extends State
class_name Walk

const speed := 200
var direction: Vector2

func enter():
	print("entering walk")

func _physics_process(_delta: float) -> void:
	var character = state_machine.get_parent()
	
	direction.x = Input.get_axis("left", "right")
	direction.y = Input.get_axis("up", "down")
	
	direction = direction.normalized()
	
	if direction.x < 0:
		%Sprite2D.flip_h = true
	
	elif direction.x > 0:
		%Sprite2D.flip_h = false

	if direction == Vector2.ZERO:
		state_machine.change_state("Idle")
		return

	if direction:
		character.velocity = direction * speed
	
	else:
		character.velocity = character.velocity.move_toward(Vector2.ZERO, speed)
	
	character.move_and_slide()
