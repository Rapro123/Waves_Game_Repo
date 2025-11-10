extends Node2D

@export var enemy = preload("res://scenes/enemy.tscn")
@onready var wave_timer: Timer = $wave_timer

var can_spawn = true

func _on_timer_timeout() -> void:
	if can_spawn:
		wave_timer.start()
		for n in range(5):
			var enemy_2 = enemy.instantiate()
			enemy_2.position = position
			get_parent().get_node("enemy_handler").add_child(enemy_2)
			
		can_spawn = false

func _on_wave_timer_timeout() -> void:
	can_spawn = true
