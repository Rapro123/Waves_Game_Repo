extends State
class_name Idle

func enter():
	print("entering idle")
	

func handle_input(_event: InputEvent):
	if Input.get_vector("left", "right", "up", "down"):
		state_machine.change_state("Walk")
