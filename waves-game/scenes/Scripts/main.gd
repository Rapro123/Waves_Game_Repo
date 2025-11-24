extends Node2D
signal wave_on
signal wave_off

@onready var game_over: Panel = $"CanvasLayer/game over"
@onready var wave_spawning_timer: Timer = $"wave spawning timer"
@onready var shop: Control = %shop
@onready var bg_music: AudioStreamPlayer2D = $"bg music"
@onready var game_over_sound: AudioStreamPlayer2D = $"game over"
@onready var game_over_music: AudioStreamPlayer2D = $"game over music"

var wave_spawning = false
var wave_off_emitted = true


func _ready() -> void:
	bg_music.play()
	
	game_over.hide()


func _process(_delta: float) -> void:
	var enemy_counter: int = get_node("enemy_handler").get_child_count()
	
	if enemy_counter <= 0 and wave_spawning_timer.is_stopped() and !wave_spawning:
		wave_spawning_timer.start()
	
	if wave_spawning:
		wave_on.emit()
		wave_spawning = false
		
		
	if !wave_off_emitted:
		wave_off.emit()
		wave_off_emitted = true


func _on_player_player_dead() -> void:
	game_over_sound.play()
	game_over_music.play()
	game_over.show()


func _on_wave_spawning_timer_timeout() -> void:
	wave_spawning = true
	wave_off_emitted = false


func _on_button_pressed() -> void:
	shop.show()


func _on_bg_music_finished() -> void:
	bg_music.play()
