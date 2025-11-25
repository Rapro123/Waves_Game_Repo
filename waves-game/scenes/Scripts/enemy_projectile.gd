extends Area2D

const speed := 300

var direction := Vector2.RIGHT
var damage := 1

func _process(delta: float) -> void:
	position += direction * speed * delta
	
	
func set_damage(new_damage: int):
	damage = new_damage


func _on_body_entered(_body: Node2D) -> void:
	queue_free()
