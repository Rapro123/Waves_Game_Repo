extends State
class_name Walk

const speed := 200

func enter():
	print("entering walk")

func _physics_process(_delta: float) -> void:
	var character = state_machine.get_parent()
	
	var direction = Input.get_vector("left", "right", "up", "down")	

	if direction == Vector2(0, 0):
		state_machine.change_state("Idle")
		return

	character.velocity = direction * speed
	character.move_and_slide()
