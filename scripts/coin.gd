extends Area2D

func _on_area_entered(area: Area2D) -> void:
	# si colisiona con un jugador...
	if area.is_in_group("players"):
		# se activa la animación de desaparecer
		$AnimationPlayer.play("CoinCollected")
		# deshabilitamos la forma de colisión
		$CollisionShape2D.call_deferred("set_disabled", true)


func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	queue_free()
