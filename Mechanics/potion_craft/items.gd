extends Node2D

@onready var i =  preload("res://Mechanics/potion_craft/ingredient.tscn")
# Called when the node enters the scene tree for the first time.
func _ready():
	var pos = 0
	if get_parent().name == "potion":
		for ing in globals.potion_ingredients.keys():
			var g = i.instantiate()
			add_child(g)
			
			g.position.y = pos
			g.pass_name(ing, "potion")
			if globals.potion_ingredients[ing] == 0:
				g.hide()
			pos += 150
	else:
		for ing in globals.item_ingredients.keys():
			var g = i.instantiate()
			add_child(g)
			
			g.position.y = pos
			g.pass_name(ing, "item")
			if globals.item_ingredients[ing] == 0:
				g.hide()
			pos += 150


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
