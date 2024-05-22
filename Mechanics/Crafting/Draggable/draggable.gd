extends RigidBody2D

@onready var icon = $Icon
@onready var detection = $Detection
@onready var mouse_det = $Mouse_Detection

var offset
var id

var selected = false
var inside

var corrected
var mouse_pos

var inserted = false

func _ready():
	#set_scale_me()
	pass

func _process(delta):
	if Input.is_action_just_pressed("left_mouse"):
		if inside:
			selected = true
		mouse_pos = get_global_mouse_position()
		offset = mouse_pos - self.global_position
	if Input.is_action_pressed("left_mouse") and selected and !inserted:
		mouse_pos = get_global_mouse_position()
		corrected = mouse_pos-offset
		var tween = get_tree().create_tween()
		tween.tween_property(self,"position",corrected,0.1).set_ease(Tween.EASE_OUT)

func _on_mouse_detection_mouse_entered():
	inside = true
	self.modulate = Color(1,1,0,1)
	#set_scale_me()
	#print(str(scale) + " my scale")

func _on_mouse_detection_mouse_exited():
	inside = false
	if !Input.is_action_pressed("left_mouse"):
		selected = false
	self.modulate = Color(1,1,1,1)
