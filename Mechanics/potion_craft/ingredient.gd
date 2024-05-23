extends Sprite2D

var tipe:String
var mouse_in = false
var initial_pos= Vector2()

func pass_name(n:String):
	self.tipe=n
	self.initial_pos = self.position

func _process(delta):
	
	if $hitbox.has_overlapping_areas() == true and Input.is_action_pressed("left_mouse"):
		self.position = get_global_mouse_position()
	else:
		self.position = self.initial_pos 
	

func _on_hitbox_mouse_entered():
	self.mouse_in = true
	
	


func _on_hitbox_mouse_exited():
	self.mouse_in = false
