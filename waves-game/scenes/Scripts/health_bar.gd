extends TextureProgressBar

@export var shooting_enemy := CharacterBody2D

func _ready() -> void:
	shooting_enemy.shooting_enemy_hurt.connect(update)


func _process(_delta: float) -> void:
	update()

	
func update():
	value = shooting_enemy.health * 100 / shooting_enemy.max_enemy_health
	
