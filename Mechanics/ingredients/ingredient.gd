extends Sprite2D

var ing
var what_for
var textures #add a dictionary
var player_in

func what_am_i(nam,t):
	self.ing = nam
	self.what_for = t

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("pick_up") and self.player_in:
		$ColorRect.hide()
		$adder/label.show()
		$adder/anim.play("add")
		self.hide()
		if self.what_for == "pot":
			pass #when i merge i will have the globals to add the ingredient


func _on_range_body_entered(body):
	$ColorRect.show()
	self.player_in = true
	


func _on_range_body_exited(body):
	$ColorRect.hide()
	self.player_in = false
