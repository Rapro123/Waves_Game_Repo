extends TextureProgressBar

@export var gun: Node2D

func _ready() -> void:
	gun.minus_stamina.connect(update)
	gun.plus_stamina.connect(update)

func _process(_delta: float) -> void:
	update()

func update():
	value = gun.stamina * 100 / gun.max_stamina
