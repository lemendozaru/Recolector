extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_retry_button_pressed() -> void:
	# recargamos la escena actual
	get_tree().reload_current_scene()


func _on_home_button_pressed() -> void:
	# cargamos la escena de menú
	get_tree().change_scene_to_file("res://scenes/menu.tscn")
