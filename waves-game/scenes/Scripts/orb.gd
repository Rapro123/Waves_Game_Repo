extends Area2D
signal orb_collected

@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D

var fade_time := 1.5

func _on_body_entered(_body: Node2D) -> void:
	collision_shape_2d.set_deferred("disabled", true)
	orb_collected.emit()
	fade_away()
	

func fade_away():
	var fade_tween = create_tween()
	
	fade_tween.tween_property(self, "modulate:a", 0.0, fade_time)
	

func fade_in():
	collision_shape_2d.set_deferred("disabled", false)
	
	var fade_in_tween = create_tween()
	
	fade_in_tween.tween_property(self, "modulate:a", 1.0, fade_time)
