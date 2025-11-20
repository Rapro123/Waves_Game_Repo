extends Control
signal health_restored
signal health_upgraded
signal stamina_upgraded
signal weapon_speed_upgraded
signal weapon_damage_upgraded

@onready var money: Label = $money
@export var score: int = 0

func _process(_delta: float) -> void:
	update()

func update():
	money.set_text("MONEY: " + str(score))

func _on_player_player_got_money() -> void:
	score += 5


func _on_shop_restore_health() -> void:
	if score >= 10:
		score -= 10
		health_restored.emit()
	

func _on_shop_upgrade_health() -> void:
	if score >= 20:
		score -= 20
		health_upgraded.emit()


func _on_shop_upgrade_stamina() -> void:
	if score >= 20:
		score -= 20
		stamina_upgraded.emit()


func _on_shop_upgrade_weapon_damage() -> void:
	if score >= 25:
		score -= 25
		weapon_damage_upgraded.emit()


func _on_shop_upgrade_weapon_speed() -> void:
	if score >= 25:
		score -= 25
		weapon_speed_upgraded.emit()
