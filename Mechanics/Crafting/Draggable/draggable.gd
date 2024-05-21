extends TextureRect

var offset

func _on_gui_input(event):
	var mouse_pos = get_global_mouse_position()
	var tween = get_tree().create_tween()
	var corrected
	if Input.is_action_just_pressed("left_mouse"):
		offset = mouse_pos - self.global_position
	if Input.is_action_pressed("left_mouse"):
		corrected = mouse_pos-offset
		tween.tween_property(self,"position",corrected,0.1).set_ease(Tween.EASE_OUT)


func _on_mouse_entered():
	if !Input.is_action_pressed("left_mouse"):
		self.modulate = Color(1,1,0,1)


func _on_mouse_exited():
	if !Input.is_action_pressed("left_mouse"):
		self.modulate = Color(1,1,1,1)
