extends Area2D

signal coinCollected

func _on_body_entered(body: Node2D) -> void:
	
	
	
	queue_free()

	emit_signal("coinCollected")
