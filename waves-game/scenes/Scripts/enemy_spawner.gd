extends Node2D
signal give_score

@export var enemy = preload("res://scenes/enemy.tscn")
@onready var spawn_sound: AudioStreamPlayer2D = $"spawn sound"

var health := 1

var enemies_spawned := 5


func _on_main_wave_on() -> void:
	spawn_sound.play()
	
	for n in range(enemies_spawned):
		var enemy_instance = enemy.instantiate()
		enemy_instance.position = position
		get_parent().get_node("enemy_handler").add_child(enemy_instance)
		
		enemy_instance.enemy_died.connect(give_player_score)
	
	enemies_spawned += 2
	upgrade_health()
	health += 1
	

func give_player_score():
	give_score.emit()

func upgrade_health():
	var enemy_instance = enemy.instantiate()
	enemy_instance.health_update(health)


func _on_main_player_win() -> void:
	spawn_sound.stop()
	
	var handler = get_parent().get_node("enemy_handler")
	
	for enemies in handler.get_children():
		enemies.queue_free()
