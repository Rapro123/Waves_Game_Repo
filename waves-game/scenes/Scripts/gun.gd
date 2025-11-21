extends Node2D
signal minus_stamina
signal plus_stamina

const bullet = preload("res://scenes/projectile.tscn")
var can_shoot = true
var player_died = false
var gun_speed := 0.6

@export var max_stamina = 10
var stamina: int = max_stamina
var stamina_out = false
var stamina_regenerated := 1

@onready var stamina_replenish_timer: Timer = $"stamina_replenish timer"
@onready var timer: Timer = $gun_speed_timer
@onready var shooter: Marker2D = $shooter
@onready var out_of_combat_stamina_timer: Timer = $out_of_combat_stamina_timer
@onready var gunshot: AudioStreamPlayer2D = $gunshot


func _process(_delta: float) -> void:
	look_at(get_global_mouse_position())
	
	if Input.is_action_pressed("shoot") and can_shoot and !player_died and !stamina_out:
		out_of_combat_stamina_timer.stop()
		stamina_replenish_timer.stop()
		
		can_shoot = false
		timer.start(gun_speed)
		
		gunshot.play()
		
		var bullet_instance = bullet.instantiate()
		get_tree().get_root().add_child(bullet_instance)
		
		bullet_instance.global_position = shooter.global_position
		bullet_instance.rotation = rotation
		
		stamina -= 1
		minus_stamina.emit()
		
		if stamina <= 0:
			stamina_out = true
			stamina_replenish_timer.start()
	
	elif !Input.is_action_pressed("shoot") and out_of_combat_stamina_timer.is_stopped():
		out_of_combat_stamina_timer.start()
	
	if gun_speed <= 0:
		gun_speed = 0.1
	
	
func _on_timer_timeout() -> void:
	can_shoot = true


func _on_player_player_dead() -> void:
	timer.stop()
	can_shoot = false
	player_died = true


func _on_stamina_replenish_timer_timeout() -> void:
	if stamina < max_stamina:
		stamina += stamina_regenerated
		
		if stamina_regenerated > max_stamina:
			stamina = max_stamina
		
		plus_stamina.emit()
		
	if stamina >= 1:
		stamina_out = false
	
	if stamina >= max_stamina:
		stamina_replenish_timer.stop()


func _on_out_of_combat_stamina_timeout() -> void:
	stamina_replenish_timer.start()
