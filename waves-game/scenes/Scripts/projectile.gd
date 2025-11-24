extends Area2D

const speed := 300

var damage := 1


func _process(delta: float) -> void:
	position += transform.x * speed * delta


func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()


func set_damage(new_damage: int):
	damage = new_damage


func _on_body_entered(_body: Node2D) -> void:
	queue_free()


func _on_area_entered(_area: Area2D) -> void:
	queue_free()
