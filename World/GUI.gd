extends CanvasLayer

var portal = preload("res://Mechanics/Portal/portal.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	Autoload.gui = self


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func close_portal():
	var node = get_child(-1)
	node.queue_free()

func _on_button_pressed():
	var ins = portal.instantiate()
	self.add_child(ins)
	
