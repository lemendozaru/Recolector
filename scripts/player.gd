extends Area2D

var direction : Vector2
var speed : int = 350
var canMove : bool
var minPositions : Vector2 = Vector2(21, 168)
var maxPositions : Vector2 = Vector2(519, 743)

func _process(delta: float) -> void:
	if canMove:
		position += direction * speed * delta

func _on_up_button_button_down() -> void:
	canMove = true
	direction = Vector2.UP


func _on_up_button_button_up() -> void:
	canMove = false


func _on_down_button_button_down() -> void:
	canMove = true
	direction = Vector2.DOWN


func _on_down_button_button_up() -> void:
	canMove = false


func _on_left_button_button_down() -> void:
	canMove = true
	direction = Vector2.LEFT


func _on_left_button_button_up() -> void:
	canMove = false


func _on_right_button_button_down() -> void:
	canMove = true
	direction = Vector2.RIGHT


func _on_right_button_button_up() -> void:
	canMove = false
