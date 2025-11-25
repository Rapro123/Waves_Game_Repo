extends Node2D

var shooting_enemy = preload("res://scenes/shooting_enemy.tscn")

@export var main: Node2D

func _ready() -> void:
	main.shooting_enemies_spawn.connect(spawn_enemies)
	
	
func spawn_enemies():
	var shooting_enemy_inst = shooting_enemy.instantiate()
	
	shooting_enemy_inst.position = position
	
	get_parent().get_node("enemy_handler").add_child(shooting_enemy_inst)
