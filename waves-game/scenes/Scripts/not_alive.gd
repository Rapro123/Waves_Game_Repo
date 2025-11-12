extends State
class_name not_alive

func enter():
	print("you died")
	
	var character = state_machine.get_parent()
	
	character.velocity = Vector2.ZERO

	
func physics_update(_delta: float):
	pass
