extends Control

@onready var animation_player: AnimationPlayer = $AnimationPlayer

func resume():
	get_tree().paused = false
	animation_player.play_backwards("blur")
	get_viewport().gui_release_focus()

func pause():
	get_tree().paused = true
	animation_player.play("blur")
	
func Esc():
	if Input.is_action_just_pressed("esc") and get_tree().paused == false:
		pause()
	
	elif Input.is_action_just_pressed("esc") and get_tree().paused:
		resume()
		

func _on_resume_pressed() -> void:
	resume()


func _on_restart_pressed() -> void:
	resume()
	get_tree().reload_current_scene()


func _on_exit_pressed() -> void:
	get_tree().quit()
	
func _process(_delta: float) -> void:
	Esc()
