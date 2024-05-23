extends Node2D

@onready var needle = $Needle
@onready var animate = $"../AnimationPlayer"

var offset

var currently_selected = []

var selected = false
var dragging = false
var inside = false

var mouse_pos
var corrected

var droppable_pos
var can_drop = false
var body_part = null


func _process(delta):
	if Input.is_action_just_pressed("left_mouse"):
		if inside:
			selected = true
		mouse_pos = get_global_mouse_position()
		offset = mouse_pos - needle.global_position
	if Input.is_action_pressed("left_mouse") and selected:
		mouse_pos = get_global_mouse_position()
		corrected = mouse_pos-offset
		var tween = get_tree().create_tween()
		tween.tween_property(needle,"position",corrected,0.1).set_ease(Tween.EASE_OUT)
	elif Input.is_action_just_released("left_mouse"):
		if can_drop and body_part != null:
			var tween = get_tree().create_tween()
			tween.tween_property(body_part,"position",droppable_pos,0.2).set_ease(Tween.EASE_OUT)
			can_drop = false
			body_part = null

func clear_all():
	for i in currently_selected:
		i.get_child(1).self_modulate = Color(1,1,1,1)
	currently_selected.clear()

func join_parts():
	var main_id
	var number
	for i in range(currently_selected.size()):
		if currently_selected[i].id != "Body":
			main_id = currently_selected[i].id
			number = i
	match main_id:
		"Left_Leg":
			animate.play("L_Leg-Body")
		"Right_Leg":
			animate.play("R_Leg-Body")
		"Head":
			animate.play("Head-Body")
		"Left_Hand":
			animate.play("L_Hand-Body")
		"Right_Hand":
			animate.play("R_Hand-Body")
		_:
			pass
	clear_all()

func join_parts_check():
	for i in currently_selected:
		if i.id == "Body":
			join_parts()
	clear_all()

func _on_mouse_mouse_entered():
	inside = true
	
func _on_mouse_mouse_exited():
	inside = false
	if !Input.is_action_pressed("left_mouse"):
		selected = false


func _on_leg_1_body_entered(body):
	var node = $Leg1.get_child(0)
	var img = $"../Crafting/Leg1"
	if body.is_in_group("parts"):
		if body.id !="Left_Leg":
			return
		body_part = body
		can_drop = true
		droppable_pos = node.global_position
		img.self_modulate = Color(0,0,1,1)


func _on_leg_2_body_entered(body):
	var node = $Leg2.get_child(0)
	var img = $"../Crafting/Leg2"
	if body.is_in_group("parts"):
		if body.id !="Right_Leg":
			return
		body_part = body
		can_drop = true
		droppable_pos = node.global_position
		img.self_modulate = Color(0,0,1,1)


func _on_head_body_entered(body):
	var node = $Head.get_child(0)
	var img = $"../Crafting/Head"
	if body.is_in_group("parts"):
		if body.id !="Head":
			return
		body_part = body
		can_drop = true
		droppable_pos = node.global_position
		img.self_modulate = Color(0,0,1,1)


func _on_body_body_entered(body):
	var node = $Body.get_child(0)
	var img = $"../Crafting/Body"
	if body.is_in_group("parts"):
		if body.id !="Body":
			return
		body_part = body
		can_drop = true
		droppable_pos = node.global_position
		img.self_modulate = Color(0,0,1,1)


func _on_hand_1_body_entered(body):
	var node = $Hand1.get_child(0)
	var img = $"../Crafting/Hand1"
	if body.is_in_group("parts"):
		if body.id !="Left_Hand":
			return
		body_part = body
		can_drop = true
		droppable_pos = node.global_position
		img.self_modulate = Color(0,0,1,1)


func _on_hand_2_body_entered(body):
	var node = $Hand2.get_child(0)
	var img = $"../Crafting/Hand2"
	if body.is_in_group("parts"):
		if body.id !="Right_Hand":
			return
		body_part = body
		can_drop = true
		droppable_pos = node.global_position
		img.self_modulate = Color(0,0,1,1)

##Exiting Functions

func _on_leg_1_body_exited(body):
	var img = $"../Crafting/Leg1"
	if body.is_in_group("parts"):
		if body.id !="Left_Leg":
			return
		can_drop = false
		body_part = null
		img.self_modulate = Color(1,1,1,1)

func _on_leg_2_body_exited(body):
	var img = $"../Crafting/Leg2"
	if body.is_in_group("parts"):
		if body.id !="Right_Leg":
			return
		can_drop = false
		body_part = null
		img.self_modulate = Color(1,1,1,1)


func _on_head_body_exited(body):
	var img = $"../Crafting/Head"
	if body.is_in_group("parts"):
		if body.id !="Head":
			return
		can_drop = false
		body_part = null
		img.self_modulate = Color(1,1,1,1)


func _on_body_body_exited(body):
	var img = $"../Crafting/Body"
	if body.is_in_group("parts"):
		if body.id !="Body":
			return
		can_drop = false
		body_part = null
		img.self_modulate = Color(1,1,1,1)


func _on_hand_1_body_exited(body):
	var img = $"../Crafting/Hand1"
	if body.is_in_group("parts"):
		if body.id !="Left_Hand":
			return
		can_drop = false
		body_part = null
		img.self_modulate = Color(1,1,1,1)


func _on_hand_2_body_exited(body):
	var img = $"../Crafting/Hand2"
	if body.is_in_group("parts"):
		if body.id !="Right_Hand":
			return
		can_drop = false
		body_part = null
		img.self_modulate = Color(1,1,1,1)


func _on_mouse_body_entered(body):
	if body.is_in_group("parts") and currently_selected.size() < 2 and body not in currently_selected:
		currently_selected.append(body)
		body.get_child(1).self_modulate = Color(1,0,0,1)
		if currently_selected.size() >= 2:
			join_parts_check()


func _on_mouse_body_exited(body):
	pass # Replace with function body.
