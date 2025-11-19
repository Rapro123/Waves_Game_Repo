extends Control

@onready var money: Label = $money
var score: int = 0

func _process(_delta: float) -> void:
	update()

func update():
	money.set_text("MONEY: " + str(score))

func _on_player_player_got_money() -> void:
	score += 5
