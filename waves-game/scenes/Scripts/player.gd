extends CharacterBody2D
signal player_dead

@export var health = 5
@onready var timer: Timer = $"out of zone damage"
@onready var enemy_damage_timer: Timer = $"enemy damage timer"
@onready var first_hit_timer: Timer = $"first hit timer"

var dead = false
var can_get_hit = true

func _process(_delta: float) -> void:
	check_for_death()
	
func _on_area_2d_body_exited(_body: Node2D) -> void:
	timer.start()


func _on_area_2d_body_entered(_body: Node2D) -> void:
	timer.stop()


func check_for_death():
	if  health <= 0 and !dead:
		dead = true
		player_dead.emit()
		timer.stop()


func _on_out_of_zone_damage_timeout() -> void:
	health -= 1
	print(health)


func _on_hitbox_area_entered(_area: Area2D) -> void:
	first_hit_timer.start()
	enemy_damage_timer.start()


func _on_hitbox_area_exited(_area: Area2D) -> void:
	enemy_damage_timer.stop()


func _on_enemy_damage_timer_timeout() -> void:
	health -= 1
	print(health)
