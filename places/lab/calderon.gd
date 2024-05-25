extends ColorRect


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_button_pressed():
	if $range.has_overlapping_bodies():
		get_tree().change_scene_to_file('res://Mechanics/potion_craft/potion.tscn') #to be changed
		
