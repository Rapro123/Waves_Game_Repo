extends CharacterBody2D
signal player_dead
signal player_hurt

const max_health = 5
@onready var health: int = max_health

@onready var timer: Timer = %"out of zone damage"
@onready var enemy_damage_timer: Timer = %"enemy damage timer"
@onready var can_get_hit_timer: Timer = %"can get hit timer"
@onready var animated_sprite_2d: AnimatedSprite2D = %AnimatedSprite2D

var dead = false
var can_get_hit = true

func _process(_delta: float) -> void:
	check_for_death()
	
func _on_area_2d_body_exited(_body: Node2D) -> void:
	timer.start()


func _on_area_2d_body_entered(_body: Node2D) -> void:
	timer.stop()


func check_for_death():
	if health <= 0 and !dead:
		dead = true
		player_dead.emit()
		timer.stop()

func get_hurt():
	player_hurt.emit()
	health -= 1

func _on_out_of_zone_damage_timeout() -> void:
	get_hurt()

func _on_hitbox_area_entered(_area: Area2D) -> void:
	enemy_damage_timer.start()

	if can_get_hit and !dead:
		get_hurt()
		can_get_hit = false
		can_get_hit_timer.start()

func _on_enemy_damage_timer_timeout() -> void:
	if can_get_hit and !dead:
		get_hurt()
		can_get_hit = false
		can_get_hit_timer.start()
	

func _on_can_get_hit_timer_timeout() -> void:
	can_get_hit = true


func _on_hitbox_area_exited(_area: Area2D) -> void:
	enemy_damage_timer.stop()
