extends Node2D

var finished = preload("res://Mechanics/finished_product.tscn")

var ingredients = []
var ing = ["berries","sting","bat wing"]
var potions =  [["heal","courage","Last Stand"],
			 	["thick skin","strenght","berserk"],
				["escape","fury","lighting"]]

func craft_pot(ingredient):
	ingredients.append(ingredient)
	if len(ingredients) == 2:
		var f = finished.instantiate()
		var created = potions[ing.find(ingredients[1],0)][ing.find(ingredients[0],0)]
		globals.potion_inventory.append(created)
		
		
		add_child(f)
		f.get_child(1).play("new_animation")
		f.what_am_i(created,"pot")
		ingredients.clear()
