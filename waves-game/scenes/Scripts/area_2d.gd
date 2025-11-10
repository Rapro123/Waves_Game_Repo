extends Area2D

@onready var timer: Timer = $Timer

func _process(_delta: float) -> void:
	if global_scale >= Vector2(2, 2):
		timer.stop()

func _on_timer_timeout() -> void:
	global_scale += Vector2(0.35, 0.35)
