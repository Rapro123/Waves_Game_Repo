extends CharacterBody2D

@export var enemy_health := 5
var dead = false

func _process(_delta: float) -> void:
	move_and_slide()
	check_death()
	
	if dead == true:
		queue_free()


func _on_hitbox_area_entered(area: Area2D) -> void:
	print("Hit enemy.")
	
	enemy_health -= 1

func check_death():
	if enemy_health <= 0:
		dead = true
