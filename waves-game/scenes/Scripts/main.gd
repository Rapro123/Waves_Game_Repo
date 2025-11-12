extends Node2D

@onready var game_over: Panel = $"CanvasLayer/game over"

func _ready() -> void:
	game_over.hide()

func _on_player_player_dead() -> void:
	game_over.show()
