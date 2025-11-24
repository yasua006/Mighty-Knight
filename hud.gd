extends Control

var rydder = null
var ny_rydder = null

var old_speed: int = 0


func _ready() -> void:
	$level_label.hide()
	$level_label_timer.start()
	
	# få hastigheten før 0 stilling
	rydder = get_tree().root.get_child(1).get_child(1)
	old_speed = rydder.speed
	
	# 0 hastighet når på menyen
	rydder.speed = 0


func _on_level_label_timer_timeout() -> void:
	$level_label.show()
	
	# håndtere animasjoner av
	if not $level_label/anim.active:
		$level_label.position = Vector2(300, 150)
		$anim_av_timer.start()
	else:
		# vis nivå animasjon
		$level_label/anim.play("fade_label")


func hjelper() -> void:
	$level_label.hide()
	
	# få førrige hastigheten
	rydder.speed = old_speed


func _on_anim_av_timer_timeout() -> void:
	hjelper()


func _on_anim_animation_finished(_anim_name: StringName) -> void:
	hjelper()
