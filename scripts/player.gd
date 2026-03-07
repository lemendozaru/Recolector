extends Area2D

var direction : Vector2
@export var speed : int = 350
var score : int
var canMove : bool
var minPositions : Vector2 = Vector2(21, 168)
var maxPositions : Vector2 = Vector2(519, 743)
# monedas recolectadas por nivel
var coins_collected : int

func _process(delta: float) -> void:
	if canMove:
		position += direction * speed * delta
		position.x = clamp(position.x, minPositions.x, maxPositions.x)
		position.y = clamp(position.y, minPositions.y, maxPositions.y)
	else:
		$AnimatedSprite2D.animation = "Idle"

func _on_up_button_button_down() -> void:
	canMove = true
	direction = Vector2.UP
	$AnimatedSprite2D.animation = "Back"


func _on_up_button_button_up() -> void:
	canMove = false


func _on_down_button_button_down() -> void:
	canMove = true
	direction = Vector2.DOWN
	$AnimatedSprite2D.animation = "Front"


func _on_down_button_button_up() -> void:
	canMove = false


func _on_left_button_button_down() -> void:
	canMove = true
	direction = Vector2.LEFT
	$AnimatedSprite2D.animation = "Walk"
	$AnimatedSprite2D.flip_h = true


func _on_left_button_button_up() -> void:
	canMove = false


func _on_right_button_button_down() -> void:
	canMove = true
	direction = Vector2.RIGHT
	$AnimatedSprite2D.animation = "Walk"
	$AnimatedSprite2D.flip_h = false


func _on_right_button_button_up() -> void:
	canMove = false


func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("coins"):
		# contamos las monedas recolectadas
		coins_collected += 1
		# incrementamos el puntaje
		score += 1
		# cargamos el nodo CoinsLabel del nodo padre y le asignamos el puntaje
		get_parent().get_node("UI/CoinsLabel").text = "Coins: " + str(score)
		# si coincide el nivel con las monedas recolectadas...
		if coins_collected == get_parent().level:
			# reiniciamos el contador de monedas
			coins_collected = 0
			get_parent().level_passed()
			
