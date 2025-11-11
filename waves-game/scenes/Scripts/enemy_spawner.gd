extends Node2D

@export var enemy = preload("res://scenes/enemy.tscn")
@onready var wave_timer: Timer = $wave_timer
@onready var enemy_handler: Node = $"../enemy_handler"

var can_spawn = true

func _on_timer_timeout() -> void:
	var enemies_on_scene := enemy_handler.get_child_count()

	if can_spawn and enemies_on_scene <= 5:
		wave_timer.start()
		for n in range(5):
			var enemy_2 = enemy.instantiate()
			enemy_2.position = position
			get_parent().get_node("enemy_handler").add_child(enemy_2)
			
		can_spawn = false

func _on_wave_timer_timeout() -> void:
	can_spawn = true
