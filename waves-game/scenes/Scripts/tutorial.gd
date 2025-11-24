extends Control

@onready var bg_music: AudioStreamPlayer2D = $"bg music"

func _ready() -> void:
	bg_music.play()

func _on_play_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/main.tscn")
	

func _on_back_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")


func _on_bg_music_finished() -> void:
	bg_music.play()
