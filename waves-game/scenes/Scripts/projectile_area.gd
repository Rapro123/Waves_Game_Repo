extends Area2D

var damage := 1

func _on_body_entered(_body: Node2D) -> void:
	get_parent().queue_free()


func _on_area_entered(_area: Area2D) -> void:
	get_parent().queue_free()


func set_damage(new_damage: int):
	damage = new_damage
