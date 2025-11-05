extends State
class_name chase

@export var enemy: CharacterBody2D
@export var speed := 100

var player: CharacterBody2D

func enter():
	player = get_tree().get_first_node_in_group("player")


func physics_update(_delta: float):
	var direction = player.global_position - enemy.global_position
	
	if direction.length() > 25:
		enemy.velocity = direction.normalized() * speed
	
	else:
		enemy.velocity = Vector2(0, 0)
