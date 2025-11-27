extends CharacterBody2D
signal enemy_died
signal enemy_hurt

@export var max_enemy_health = 5
@onready var enemy_health: int = max_enemy_health

@onready var hurt_sound: AudioStreamPlayer2D = $"hurt sound"
@onready var collision_shape_2d: CollisionShape2D = %CollisionShape2D

var dead = false

var fade_duration := 1.5

func _process(_delta: float) -> void:
	move_and_slide()
	
	if !dead:
		check_death()
	
func _on_hitbox_area_entered(area: Area2D) -> void:	
	if "damage" in area and !dead:
		enemy_health -= area.damage

		enemy_hurt.emit()

func check_death():
	if enemy_health <= 0:
		dead = true
		enemy_died.emit()
		hurt_sound.play()
		fade_away()
		
		collision_shape_2d.set_deferred("disabled", true)
		

func health_update(new_health: int):
	max_enemy_health += new_health


func _on_hurt_sound_finished() -> void:
	if dead:
		queue_free()


func fade_away():
	var fade_tween = create_tween()
	
	fade_tween.tween_property(self, "modulate:a", 0.0, fade_duration)
