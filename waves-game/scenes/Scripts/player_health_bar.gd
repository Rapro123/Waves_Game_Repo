extends TextureProgressBar

@export var player: CharacterBody2D

func _ready() -> void:
	player.player_hurt.connect(update)
	update()

func update():
	value = player.health * 100 / player.max_health
