extends Area2D

signal moneda_recolectada  # Cambié el nombre para que coincida con el otro script

func _on_body_entered(body):
	if body.is_in_group("jugador"):  # Verifica que sea el jugador
		emit_signal("moneda_recolectada")
		queue_free()
