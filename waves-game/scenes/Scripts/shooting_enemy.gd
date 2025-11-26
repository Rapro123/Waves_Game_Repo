extends CharacterBody2D
signal shooting_enemy_hurt

@export var max_enemy_health := 5
@onready var health: int = max_enemy_health

@onready var ray_cast_2d: RayCast2D = $RayCast2D
@onready var shooting_timer: Timer = $"shooting timer"
@onready var marker_2d: Marker2D = $Marker2D
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var can_get_hurt_timer: Timer = $"can get hurt timer"
@onready var shoot_sound: AudioStreamPlayer2D = %"shoot sound"

const bullet = preload("res://scenes/enemy_projectile.tscn")

@onready var player = get_tree().get_first_node_in_group("player")

var dead = false
var can_get_hurt = true


func _process(_delta: float) -> void:
	check_for_death()


func _physics_process(_delta: float) -> void:
	aim()
	check_for_player_collision()
	
	
func aim():
	ray_cast_2d.target_position = to_local(player.position)
	
	
func check_for_player_collision():
	if ray_cast_2d.get_collider() == player and shooting_timer.is_stopped():
		shooting_timer.start()
	elif ray_cast_2d.get_collider() != player and !shooting_timer.is_stopped():
		shooting_timer.stop()


func _on_shooting_timer_timeout() -> void:
	shoot()
	
	
func shoot():
	var projectile = bullet.instantiate()
	
	projectile.position = marker_2d.global_position
	projectile.direction = (ray_cast_2d.target_position).normalized()
	get_tree().current_scene.add_child(projectile)
	
	shoot_sound.play()


func check_for_death():
	if health <= 0:
		queue_free()


func _on_hitbox_area_entered(_area: Area2D) -> void:
	if can_get_hurt and can_get_hurt_timer.is_stopped():
		shooting_enemy_hurt.emit()
		can_get_hurt = false
		can_get_hurt_timer.start()
		
		health -= 1


func _on_can_get_hurt_timer_timeout() -> void:
	can_get_hurt = true
