extends Area2D

func _on_area_entered(area: Area2D) -> void:
	# si colisiona con un jugador...
	if area.is_in_group("players"):
		# se elimina
		queue_free()
