extends Node2D

@onready var bg_music: AudioStreamPlayer2D = $"bg music"

func _ready() -> void:
	bg_music.play()

func _on_play_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/main.tscn")


func _on_exit_pressed() -> void:
	get_tree().quit()


func _on_tutorial_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/tutorial.tscn")


func _on_bg_music_finished() -> void:
	bg_music.play()
