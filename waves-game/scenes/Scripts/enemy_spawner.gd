extends Node2D
signal give_score

@export var enemy = preload("res://scenes/enemy.tscn")
@onready var enemy_handler: Node = $"../enemy_handler"

var enemies_spawned := 5


func _on_main_wave_on() -> void:
	print("spawning enemies")
	
	for n in range(enemies_spawned):
		var enemy_instance = enemy.instantiate()
		enemy_instance.position = position
		get_parent().get_node("enemy_handler").add_child(enemy_instance)
		
		enemy_instance.enemy_died.connect(give_player_score)
	
	enemies_spawned += 1
	
func give_player_score():
	give_score.emit()
