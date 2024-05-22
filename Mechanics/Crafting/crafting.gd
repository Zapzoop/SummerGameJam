extends Control

@onready var node_to_attach = $"../Physics"

var sprites = {
	"Left_Leg":"res://icon.svg",
	"Right_Leg":"res://icon.svg",
	"Left_Hand":"res://icon.svg",
	"Right_Hand":"res://icon.svg",
	"Head":"res://icon.svg",
	"Body":"res://icon.svg"
}

var draggable = preload("res://Mechanics/Crafting/Draggable/draggable.tscn")

var currently_selected = []

func _on_leg_1_button_button_down():
	var variant = sprites["Left_Leg"]
	var instance = draggable.instantiate()
	instance.id = "Left_Leg"
	instance.global_position = get_global_mouse_position()
	node_to_attach.add_child(instance)
	var icon = instance.icon
	var detection = instance.detection
	var mouse_det = instance.mouse_det
	icon.texture = load(variant)
	icon.scale = Vector2(0.3,1)
	detection.scale = Vector2(0.3,1)
	mouse_det.scale = Vector2(0.3,1)

func _on_leg_2_button_button_down():
	var variant = sprites["Right_Leg"]
	var instance = draggable.instantiate()
	instance.id = "Right_Leg"
	instance.global_position = get_global_mouse_position()
	node_to_attach.add_child(instance)
	var icon = instance.icon
	var detection = instance.detection
	var mouse_det = instance.mouse_det
	icon.texture = load(variant)
	icon.scale = Vector2(0.3,1)
	detection.scale = Vector2(0.3,1)
	mouse_det.scale = Vector2(0.3,1)


func _on_body_button_button_down():
	var variant = sprites["Body"]
	var instance = draggable.instantiate()
	instance.id = "Body"
	instance.global_position = get_global_mouse_position()
	node_to_attach.add_child(instance)
	var icon = instance.icon
	icon.texture = load(variant)


func _on_hand_1_button_button_down():
	var variant = sprites["Left_Hand"]
	var instance = draggable.instantiate()
	instance.id = "Left_Hand"
	instance.global_position = get_global_mouse_position()
	node_to_attach.add_child(instance)
	var icon = instance.icon
	var detection = instance.detection
	var mouse_det = instance.mouse_det
	icon.texture = load(variant)
	icon.scale = Vector2(1,0.3)
	detection.scale = Vector2(1,0.3)
	mouse_det.scale = Vector2(1,0.3)


func _on_hand_2_button_button_down():
	var variant = sprites["Right_Hand"]
	var instance = draggable.instantiate()
	instance.id = "Right_Hand"
	instance.global_position = get_global_mouse_position()
	node_to_attach.add_child(instance)
	var icon = instance.icon
	var detection = instance.detection
	var mouse_det = instance.mouse_det
	icon.texture = load(variant)
	icon.scale = Vector2(1,0.3)
	detection.scale = Vector2(1,0.3)
	mouse_det.scale = Vector2(1,0.3)


func _on_head_button_button_down():
	var variant = sprites["Head"]
	var instance = draggable.instantiate()
	instance.id = "Head"
	instance.global_position = get_global_mouse_position()
	node_to_attach.add_child(instance)
	var icon = instance.icon
	var detection = instance.detection
	var mouse_det = instance.mouse_det
	icon.texture = load(variant)
	icon.scale = Vector2(0.5,0.5)
	detection.scale = Vector2(0.5,0.5)
	mouse_det.scale = Vector2(0.5,0.5)


func _on_leg_1_item_rect_changed():
	var scale_x = 0.3
	var scale_y = 1
	
	var node = $Leg1
	var to_affect = $"../Physics/Leg1"
	
	var collision_boundary = to_affect.get_child(0)

	#Position changing
	to_affect.position = node.position
	
	#Setting centre
	var size_of_node = node.size
	
	var centre_pos_x = (size_of_node.x * scale_x)/2
	var centre_pos_y = (size_of_node.y * scale_y)/2
	var centre_pos = Vector2(centre_pos_x,centre_pos_y)
	
	collision_boundary.position = centre_pos
	
	#Chaning size of rec
	var rectangle = RectangleShape2D.new()
	rectangle.size = centre_pos * 2 #cause we need to adjust both side
	collision_boundary.set_shape(rectangle)


func _on_leg_2_item_rect_changed():
	var scale_x = 0.3
	var scale_y = 1
	
	var node = $Leg2
	var to_affect = $"../Physics/Leg2"
	
	var collision_boundary = to_affect.get_child(0)

	#Position changing
	to_affect.position = node.position
	
	#Setting centre
	var size_of_node = node.size
	
	var centre_pos_x = (size_of_node.x * scale_x)/2
	var centre_pos_y = (size_of_node.y * scale_y)/2
	var centre_pos = Vector2(centre_pos_x,centre_pos_y)
	
	collision_boundary.position = centre_pos
	
	#Chaning size of rec
	var rectangle = RectangleShape2D.new()
	rectangle.size = centre_pos * 2 #cause we need to adjust both side
	collision_boundary.set_shape(rectangle)


func _on_body_item_rect_changed():
	var scale_x = 1
	var scale_y = 1
	
	var node = $Body
	var to_affect = $"../Physics/Body"
	
	var collision_boundary = to_affect.get_child(0)

	#Position changing
	to_affect.position = node.position
	
	#Setting centre
	var size_of_node = node.size
	
	var centre_pos_x = (size_of_node.x * scale_x)/2
	var centre_pos_y = (size_of_node.y * scale_y)/2
	var centre_pos = Vector2(centre_pos_x,centre_pos_y)
	
	collision_boundary.position = centre_pos
	
	#Chaning size of rec
	var rectangle = RectangleShape2D.new()
	rectangle.size = centre_pos * 2 #cause we need to adjust both side
	collision_boundary.set_shape(rectangle)


func _on_hand_1_item_rect_changed():
	var scale_x = 1
	var scale_y = 0.3
	
	var node = $Hand1
	var to_affect = $"../Physics/Hand1"
	
	var collision_boundary = to_affect.get_child(0)

	#Position changing
	to_affect.position = node.position
	
	#Setting centre
	var size_of_node = node.size
	
	var centre_pos_x = (size_of_node.x * scale_x)/2
	var centre_pos_y = (size_of_node.y * scale_y)/2
	var centre_pos = Vector2(centre_pos_x,centre_pos_y)
	
	collision_boundary.position = centre_pos
	
	#Chaning size of rec
	var rectangle = RectangleShape2D.new()
	rectangle.size = centre_pos * 2 #cause we need to adjust both side
	collision_boundary.set_shape(rectangle)
	


func _on_hand_2_item_rect_changed():
	var scale_x = 1
	var scale_y = 0.3
	
	var node = $Hand2
	var to_affect = $"../Physics/Hand2"
	
	var collision_boundary = to_affect.get_child(0)

	#Position changing
	to_affect.position = node.position
	
	#Setting centre
	var size_of_node = node.size
	
	var centre_pos_x = (size_of_node.x * scale_x)/2
	var centre_pos_y = (size_of_node.y * scale_y)/2
	var centre_pos = Vector2(centre_pos_x,centre_pos_y)
	
	collision_boundary.position = centre_pos
	
	#Chaning size of rec
	var rectangle = RectangleShape2D.new()
	rectangle.size = centre_pos * 2 #cause we need to adjust both side
	collision_boundary.set_shape(rectangle)
	


func _on_head_item_rect_changed():
	var scale_x = 0.5
	var scale_y = 0.5
	
	var node = $Head
	var to_affect = $"../Physics/Head"
	
	var collision_boundary = to_affect.get_child(0)

	#Position changing
	to_affect.position = node.position
	
	#Setting centre
	var size_of_node = node.size
	
	var centre_pos_x = (size_of_node.x * scale_x)/2
	var centre_pos_y = (size_of_node.y * scale_y)/2
	var centre_pos = Vector2(centre_pos_x,centre_pos_y)
	
	collision_boundary.position = centre_pos
	
	#Chaning size of rec
	var rectangle = RectangleShape2D.new()
	rectangle.size = centre_pos * 2 #cause we need to adjust both side
	collision_boundary.set_shape(rectangle)
	
