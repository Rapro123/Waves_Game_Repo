extends TextureProgressBar

@export var enemy = CharacterBody2D

func _ready() -> void:
	enemy.enemy_hurt.connect(update)
	
func _process(_delta: float) -> void:
	update()

func update():
	value = enemy.enemy_health * 100 / enemy.max_enemy_health
	
