extends CharacterBody2D

signal death

@export var enemy_health := 5

@warning_ignore("shadowed_global_identifier")
var dead = false

func _process(_delta: float) -> void:
	move_and_slide()
	check_death()
	
	if dead == true:
		death.emit()
		queue_free()


func _on_hitbox_area_entered(_area: Area2D) -> void:
	print("Hit enemy.")
	
	enemy_health -= 1

func check_death():
	if enemy_health <= 0:
		dead = true
