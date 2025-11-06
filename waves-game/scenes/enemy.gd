extends CharacterBody2D

@export var enemy_health := 5

func _process(_delta: float) -> void:
	move_and_slide()
