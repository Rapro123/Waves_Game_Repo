extends Node2D
signal wave_on
signal wave_off
signal shooting_enemies_spawn
signal player_win

@onready var game_over: Panel = $"CanvasLayer/game over"
@onready var wave_spawning_timer: Timer = $"wave spawning timer"
@onready var shop: Control = %shop
@onready var bg_music: AudioStreamPlayer2D = $"bg music"
@onready var game_over_sound: AudioStreamPlayer2D = $"game over"
@onready var game_over_music: AudioStreamPlayer2D = $"game over music"
@onready var wave_counter_text: Label = $"CanvasLayer/wave counter"
@onready var win_screen: Panel = $"CanvasLayer/win screen"
@onready var win_sound: AudioStreamPlayer2D = $"win sound"
@onready var win_music: AudioStreamPlayer2D = $"win music"
@onready var orbs: Node = $orbs

var wave_spawning = false
var wave_off_emitted = true

var wave_counter: int = 0

var player_win_bool = false

var orbs_collected := 0

func _ready() -> void:
	bg_music.play()
	
	game_over.hide()


func _process(_delta: float) -> void:
	var enemy_counter: int = get_node("enemy_handler").get_child_count()
	
	if enemy_counter <= 0 and wave_spawning_timer.is_stopped() and !wave_spawning:
		wave_spawning_timer.start()
	
	if wave_spawning:
		wave_counter += 1
		wave_on.emit()
		
		if wave_counter > 3:
			shooting_enemies_spawn.emit()
			
		if orbs_collected == 4:
			for orb in orbs.get_children():
				if orb.has_method("fade_in"):
					orb.fade_in()
					
			orbs_collected = 0
			
		wave_spawning = false
		
		
	if !wave_off_emitted:
		wave_off.emit()
		wave_off_emitted = true
		
	wave_counter_text.set_text("WAVE " + str(wave_counter))
	
	if wave_counter > 5 and !player_win_bool:
		win_screen.show()
		player_win.emit()


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


func _on_player_win() -> void:
	player_win_bool = true
	win_sound.play()
	win_music.play()


func _on_orb_orb_collected() -> void:
	orbs_collected += 1
