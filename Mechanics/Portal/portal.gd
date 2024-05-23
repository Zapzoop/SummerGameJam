extends Node2D

@onready var first = $"1"
@onready var second = $"2"
@onready var third = $"3"
@onready var forth = $"4"
@onready var fifth = $"5"
@onready var sixth = $"6"
@onready var seventh = $"7"
@onready var eighth = $"8"
@onready var ninth = $"9"

@onready var needle = $Needle

var group1 = [1,2,3]
var group2 = [4,8,9]
var group3 = [5,6,7]
var visible_node = []

var selected = false
var inside = false
var offset

var mouse_pos
var corrected


var click_pos = []
var can_draw = false
var clear_draw = false
var line_pos = []


var y_offset = Vector2(0,512)
var start 
var end

func _input(event):
	if not Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		return
	## Corrected is measured from centre of needle
	if corrected != null and can_draw:
		click_pos.append(corrected - y_offset)
		queue_redraw()
	
func _draw():
	if can_draw and corrected != null:
		for point in click_pos:
			draw_circle(point,5,Color(1,0,0,1))
			#draw_line(Vector2(700,800),Vector2(800,900),Color(1,0,0,1),-1,true)
	elif clear_draw:
		pass
	
	if not line_pos.is_empty():
		for i in line_pos:
			draw_line(i[0],i[1],Color(1,0,0,1),-1,true)
	

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
		can_draw =false

func remove_duplicates(arr):
	var unique_arr = []
	for item in arr:
		if not unique_arr.has(item):
			unique_arr.append(item)
	return unique_arr


func dot_decider():
	var grp1_count = randi_range(2,3)
	var grp2_count = randi_range(2,3)
	var grp3_count = randi_range(2,3)
	
	var grp1_numbers = []
	var grp2_numbers = []
	var grp3_numbers = []
	
	for i in range(grp1_count):
		var random = randi_range(0,2)
		grp1_numbers.append(random)
		
	for i in range(grp2_count):
		var random = randi_range(0,2)
		grp2_numbers.append(random)
		
	for i in range(grp2_count):
		var random = randi_range(0,2)
		grp3_numbers.append(random)
	
	for i in grp1_numbers:
		visible_node.append(group1[i])
		match group1[i]:
			1:
				first.show()
			2:
				second.show()
			3:
				third.show()
	
	for i in grp2_numbers:
		visible_node.append(group2[i])
		match group2[i]:
			4:
				forth.show()
			8:
				eighth.show()
			9:
				ninth.show()
	
	for i in grp3_numbers:
		visible_node.append(group3[i])
		match group3[i]:
			5:
				fifth.show()
			6:
				sixth.show()
			7:
				seventh.show()
	
	visible_node = remove_duplicates(visible_node)
	visible_node.sort()
	#print(visible_node)

func _ready():
	dot_decider() # Replace with function body.



func _on_mouse_mouse_entered():
	inside = true


func _on_mouse_mouse_exited():
	inside = false
	if !Input.is_action_pressed("left_mouse"):
		selected = false

func obj_to_number(obj):
	match obj:
		first:
			return 1
		second:
			return 2
		third:
			return 3
		forth:
			return 4
		fifth:
			return 5
		sixth:
			return 6
		seventh:
			return 7
		eighth:
			return 8
		ninth:
			return 9

func check_pair():
	if line_pos.size() == visible_node.size():
		print("Portal completed")
		Autoload.portal_completed()
		Autoload.close_screen_portal()
		##Add funcion to do after portal completed

func draw_line_2d():
	var start_parent = start.get_parent()
	var end_parent = end.get_parent()
	
	var number_start = obj_to_number(start_parent)
	var number_end = obj_to_number(end_parent)

	var test_num = visible_node.find(number_start)
	if test_num+1 == visible_node.size():
		if number_end == visible_node[0]:
			var pair = [start.global_position,end.global_position]
			line_pos.append(pair)
			check_pair()
	elif visible_node[test_num + 1] == number_end:
		var pair = [start.global_position,end.global_position]
		line_pos.append(pair)
		check_pair()
		
	
	can_draw = false
	clear_draw = true
	click_pos.clear()
	queue_redraw()
	start = null
	end = null
	clear_draw = false

func _on_one_d_area_entered(area):
	var node = $"1/OneD"
	var parent = node.get_parent()
	if parent.visible == false:
		return
	can_draw = true
	if start == null:
		start = node
	elif start != self and end == null:
		end = node
		draw_line_2d()

func _on_two_d_area_entered(area):
	var node = $"2/TwoD"
	var parent = node.get_parent()
	if parent.visible == false:
		return
	can_draw = true
	if start == null:
		start = node
	elif start != self and end == null:
		end = node
		draw_line_2d()


func _on_three_d_area_entered(area):
	var node = $"3/ThreeD"
	var parent = node.get_parent()
	if parent.visible == false:
		return
	can_draw = true
	if start == null:
		start = node	

	elif start != self and end == null:
		end = node
		draw_line_2d()


func _on_forth_d_area_entered(area):
	var node = $"4/ForthD"
	var parent = node.get_parent()
	if parent.visible == false:
		return
	can_draw = true
	if start == null:
		start = node
	elif start != self and end == null:
		end = node
		draw_line_2d()


func _on_fifth_d_area_entered(area):
	var node = $"5/FifthD"
	var parent = node.get_parent()
	if parent.visible == false:
		return
	can_draw = true
	if start == null:
		start = node
	elif start != self and end == null:
		end = node
		draw_line_2d()

func _on_sixth_d_area_entered(area):
	var node = $"6/SixthD"
	var parent = node.get_parent()
	if parent.visible == false:
		return
	can_draw = true
	if start == null:
		start = node
	elif start != self and end == null:
		end = node
		draw_line_2d()


func _on_seventh_d_area_entered(area):
	var node = $"7/SeventhD"
	var parent = node.get_parent()
	if parent.visible == false:
		return
	can_draw = true
	if start == null:
		start = node
	elif start != self and end == null:
		end = node
		draw_line_2d()

func _on_eighth_d_area_entered(area):
	var node = $"8/EighthD"
	var parent = node.get_parent()
	if parent.visible == false:
		return
	can_draw = true
	if start == null:
		start = node
	elif start != self and end == null:
		end = node
		draw_line_2d()


func _on_ninth_d_area_entered(area):
	var node = $"9/NinthD"
	var parent = node.get_parent()
	if parent.visible == false:
		return
	can_draw = true
	if start == null:
		start = node
	elif start != self and end == null:
		end = node
		draw_line_2d()






func _on_button_pressed():
	Autoload.close_screen_portal()
