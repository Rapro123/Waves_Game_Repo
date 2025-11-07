extends Node2D

@export var enemy = preload("res://scenes/enemy.tscn")

func _on_timer_timeout() -> void:
	var enemy_2 = enemy.instantiate()
	enemy_2.position = position
	get_parent().get_node("enemy_handler").add_child(enemy_2)
