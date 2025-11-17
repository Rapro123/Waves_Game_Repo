extends Area2D

var max_expansion = Vector2(1.1, 1.1)

func _on_main_wave_off() -> void:
	if global_scale < max_expansion:
		global_scale += Vector2(0.05, 0.05)
		max_expansion += Vector2(0.2, 0.2)
