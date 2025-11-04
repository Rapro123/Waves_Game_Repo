extends Area2D


func _on_timer_timeout() -> void:
	global_scale += Vector2(0.35, 0.35)
