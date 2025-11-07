extends Node2D

const bullet = preload("res://scenes/projectile.tscn")
var can_shoot = true

@onready var timer: Timer = $Timer
@onready var shooter: Marker2D = $shooter


func _process(_delta: float) -> void:
	look_at(get_global_mouse_position())
	
	if Input.is_action_pressed("shoot") and can_shoot:
		can_shoot = false
		timer.start()
		
		var bullet_instance = bullet.instantiate()
		get_tree().get_root().add_child(bullet_instance)
		
		bullet_instance.global_position = shooter.global_position
		bullet_instance.rotation = rotation


func _on_timer_timeout() -> void:
	can_shoot = true
