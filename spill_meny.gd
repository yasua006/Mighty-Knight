extends Control

var music = null
var rydder = null

var old_speed: int = 0


func _ready() -> void:
	# ikke spill musikk når på menyen
	music = get_tree().root.get_child(0)
	music.playing = false
	
	# få hastigheten før 0 stilling
	rydder = get_tree().root.get_child(1).get_child(1)
	old_speed = rydder.speed
	
	# 0 hastighet når på menyen
	rydder.speed = 0


# ----hoved menyen----
func _on_start_btn_pressed() -> void:
	$hoved_container.hide()
	$bakgrunn_bilde.hide()
	
	# start å spille musikk
	music.playing = true
	
	# få førrige hastigheten
	rydder.speed = old_speed


func _on_settings_btn_pressed() -> void:
	$hoved_container.hide()
	$settings_container.show()


func _on_exit_btn_pressed() -> void:
	get_tree().quit()


# ----innstillinger menyen----
func _on_animations_btn_toggled(toggled_on: bool) -> void:
	var anim: AnimationPlayer = get_tree().root.get_child(1).get_child(3).get_child(0).get_child(0)
	
	if toggled_on:
		anim.active = false
	else:
		anim.active = true


func _on_shadows_btn_toggled(toggled_on: bool) -> void:
	var lys: PointLight2D = $"/root/main/rydder/PointLight2D"
	
	if toggled_on:
		lys.shadow_enabled = true
	else:
		lys.shadow_enabled = false


func _on_close_btn_pressed() -> void:
	$hoved_container.show()
	$settings_container.hide()
