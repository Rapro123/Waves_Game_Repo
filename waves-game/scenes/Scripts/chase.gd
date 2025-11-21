extends State
class_name chase

@onready var animated_sprite_2d: AnimatedSprite2D = %AnimatedSprite2D
@onready var footsteps: AudioStreamPlayer2D = %footsteps
@onready var footsteps_timer: Timer = $"footsteps timer"

@export var enemy: CharacterBody2D
var speed = randi_range(80, 120)

var player: CharacterBody2D

func enter():
	animated_sprite_2d.play("walk")
	player = get_tree().get_first_node_in_group("player")


func physics_update(_delta: float):
	play_footseps()
	
	if is_instance_valid(enemy) and is_instance_valid(player):
		var direction = player.global_position - enemy.global_position
		
		if direction.length() > 25:
			enemy.velocity = direction.normalized() * speed
		
		else:
			enemy.velocity = Vector2(0, 0)
			

func _on_enemy_enemy_hurt() -> void:
	state_machine.change_state("enemy_stunned")

func play_footseps():
	if footsteps_timer.is_stopped():
		footsteps_timer.start()

func _on_footsteps_timer_timeout() -> void:
	footsteps.play()
