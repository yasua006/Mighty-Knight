extends Control


func _ready() -> void:
	$level_label.hide()
	$level_label_timer.start()


func _on_level_label_timer_timeout() -> void:
	$level_label.show()
	# spill animasjon
	$level_label/AnimationPlayer.play("fade_label")
