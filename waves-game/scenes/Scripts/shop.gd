extends Control
signal restore_health
signal upgrade_health
signal upgrade_stamina
signal upgrade_stamina_regen
signal upgrade_weapon_speed
signal upgrade_weapon_damage

@onready var shop: Control = $"."

func _ready() -> void:
	shop.hide()

func _on_exit_pressed() -> void:
	shop.hide()


func _on_restore_health_pressed() -> void:
	restore_health.emit()


func _on_upgrade_health_pressed() -> void:
	upgrade_health.emit()


func _on_upgrade_stamina_pressed() -> void:
	upgrade_stamina.emit()


func _on_upgrade_weapon_speed_pressed() -> void:
	upgrade_weapon_speed.emit()


func _on_upgrade_weapon_damage_pressed() -> void:
	upgrade_weapon_damage.emit()


func _on_upgrade_stamina_regen_pressed() -> void:
	print("pressing upgrade")
	upgrade_stamina_regen.emit()
