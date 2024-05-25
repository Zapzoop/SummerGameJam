extends Sprite2D

var textures = {}#need to add all the textures here in a dictionary

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func what_am_i(nam,tipe):
	if tipe == "pot":
		$label.text = "potion of " + nam
	else:
		$label.text =  nam
	#add texture part


func _on_hitbox_mouse_entered():
	$label.show()


func _on_hitbox_mouse_exited():
	$label.hide()


func _on_button_pressed():
	self.queue_free()
