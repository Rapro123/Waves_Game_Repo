extends Control

func  _ready() -> void:
	pass

func resume():
	get_tree().paused = false

func pause():
	get_tree().paused = true
	
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
