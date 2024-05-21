extends Control

var sprites = {
	"Left_Leg":"res://icon.svg",
	"Right_Leg":"res://icon.svg",
	"Left_Hand":"res://icon.svg",
	"Right_Hand":"res://icon.svg",
	"Head":"res://icon.svg",
	"Body":"res://icon.svg"
}

var draggable = preload("res://Mechanics/Crafting/Draggable/draggable.tscn")

func _on_leg_1_button_button_down():
	var variant = sprites["Left_Leg"]
	var instance = draggable.instantiate()
	instance.global_position = get_global_mouse_position()
	instance.scale = Vector2(0.3,1)
	self.add_child(instance)
	instance.texture = load(variant)
	


func _on_leg_2_button_button_down():
	var variant = sprites["Right_Leg"]
	var instance = draggable.instantiate()
	instance.global_position = get_global_mouse_position()
	instance.scale = Vector2(0.3,1)
	self.add_child(instance)
	instance.texture = load(variant)


func _on_body_button_button_down():
	var variant = sprites["Body"]
	var instance = draggable.instantiate()
	instance.global_position = get_global_mouse_position()
	self.add_child(instance)
	instance.texture = load(variant)


func _on_hand_1_button_button_down():
	var variant = sprites["Left_Hand"]
	var instance = draggable.instantiate()
	instance.global_position = get_global_mouse_position()
	instance.scale = Vector2(1,0.3)
	self.add_child(instance)
	instance.texture = load(variant)


func _on_hand_2_button_button_down():
	var variant = sprites["Right_Hand"]
	var instance = draggable.instantiate()
	instance.global_position = get_global_mouse_position()
	instance.scale = Vector2(1,0.3)
	self.add_child(instance)
	instance.texture = load(variant)


func _on_head_button_button_down():
	var variant = sprites["Head"]
	var instance = draggable.instantiate()
	instance.global_position = get_global_mouse_position()
	instance.scale = Vector2(0.5,0.5)
	self.add_child(instance)
	instance.texture = load(variant)
