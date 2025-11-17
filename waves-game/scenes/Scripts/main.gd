extends Node2D
signal wave_on
signal wave_off

@onready var game_over: Panel = $"CanvasLayer/game over"
@onready var wave_spawning_timer: Timer = $"wave spawning timer"

var wave_spawning = false
var wave_off_emitted = false


func _ready() -> void:
	game_over.hide()


func _process(_delta: float) -> void:
	var enemy_counter: int = get_node("enemy_handler").get_child_count()
	
	if enemy_counter <= 0 and wave_spawning_timer.is_stopped() and !wave_spawning:
		wave_spawning_timer.start()
	
	if wave_spawning:
		wave_on.emit()
		wave_spawning = false
		wave_off_emitted = false
		
	if !wave_spawning and wave_off_emitted == false:
		print("emmited wave_off")
		wave_off.emit()
		wave_off_emitted = true


func _on_player_player_dead() -> void:
	game_over.show()


func _on_wave_spawning_timer_timeout() -> void:
	print("spawning ready")
	wave_spawning = true
