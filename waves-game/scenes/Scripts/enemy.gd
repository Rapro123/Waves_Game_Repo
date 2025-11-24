extends CharacterBody2D
signal enemy_died
signal enemy_hurt

@export var max_enemy_health = 5
@onready var enemy_health: int = max_enemy_health

var dead = false

func _process(_delta: float) -> void:
	move_and_slide()
	check_death()
	
func _on_hitbox_area_entered(area: Area2D) -> void:	
	if "damage" in area:
		enemy_health -= area.damage

		enemy_hurt.emit()

func check_death():
	if enemy_health <= 0:
		dead = true
		enemy_died.emit()
		queue_free()
