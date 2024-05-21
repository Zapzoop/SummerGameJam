extends Sprite2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func click():
	while Input.is_action_pressed("mouse_left"):
		show()
		position = get_global_mouse_position()
	hide()
