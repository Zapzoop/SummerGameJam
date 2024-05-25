extends Sprite2D

var tipe:String
var mouse_in = false
var initial_pos= Vector2()
var what_for

func pass_name(n:String, t:String):
	self.tipe=n
	self.initial_pos = self.global_position
	self.what_for = t

func _process(delta):
	
	if self.mouse_in and Input.is_action_pressed("left_mouse"):
		self.global_position = get_global_mouse_position()
	elif Input.is_action_just_released("left_mouse") and $/root.get_child(2).get_child(2).get_child(0).overlaps_area(get_child(1)):
			if what_for == "potion":
				globals.potion_ingredients[self.tipe]-=1
				if globals.potion_ingredients[self.tipe] > 0:
					self.global_position = self.initial_pos 
				else:
					self.hide()
				$/root/potion.craft_pot(tipe)
			if what_for == "item":
				
				globals.item_ingredients[self.tipe]-=1
				if globals.item_ingredients[self.tipe] > 0:
					self.global_position = self.initial_pos 
				else:
					self.hide()
				$/root/anvill.craft_item(tipe)
	else:
		self.global_position = self.initial_pos 
	

func _on_hitbox_mouse_entered():
	self.mouse_in = true
	$label.show()
	if what_for == "potion":
		$label.text = self.tipe + " " + str(globals.potion_ingredients[self.tipe])
	else:
		$label.text = self.tipe + " " + str(globals.item_ingredients[self.tipe])
	


func _on_hitbox_mouse_exited():
	self.mouse_in = false
	$label.hide()
