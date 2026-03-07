extends Node

# Nivel inicial del juego
var level : int = 1
# Escena a instanciar para nuestras monedas
@export var coin : PackedScene
# instanciamos el confetti
@export var confetti : PackedScene
# Área donde aparecerán las monedas
var minPositions : Vector2 = Vector2(21, 168)
var maxPositions : Vector2 = Vector2(519, 743)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	instantiate_coins()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func instantiate_coins():
	# se repetirá tantas veces como el nivel actual
	for i in range(level):
		# variable que tomará la escena instanciada
		var coin_instance : Area2D = coin.instantiate()
		# coordenada aleatoria en x
		var random_x : float = randf_range(minPositions.x, maxPositions.x)
		# coordenada aleatoria en y
		var random_y : float = randf_range(minPositions.y, maxPositions.y)
		# asignamos ambas coordenadas a la nueva escena
		coin_instance.position = Vector2(random_x, random_y)
		# agregamos la escena instanciada
		call_deferred("add_child", coin_instance)
	
func level_passed():
	# incrementamos el nivel
	level += 1
	# actualizamos el texto en pantalla
	$UI/LevelLabel.text = "Nivel: " + str(level)
	instantiate_coins()
	instantiate_confetti()
	
func instantiate_confetti():
	var confetti_instance : CPUParticles2D = confetti.instantiate()
	add_child(confetti_instance)
	confetti_instance.position = Vector2(270,980)
	confetti_instance.emitting = true
