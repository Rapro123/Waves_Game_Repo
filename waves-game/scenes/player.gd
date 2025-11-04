extends CharacterBody2D

@export var health = 5
@onready var timer: Timer = $Timer

var dead = false


func _process(_delta: float) -> void:
	check_for_death()
	
	if dead == true:
		get_tree().reload_current_scene()


func _on_area_2d_body_exited(_body: Node2D) -> void:
	timer.start()


func _on_area_2d_body_entered(_body: Node2D) -> void:
	timer.stop()


func _on_timer_timeout() -> void:
	health -= 1
	print(health)

func check_for_death():
	if  health <= 0:
		dead = true
