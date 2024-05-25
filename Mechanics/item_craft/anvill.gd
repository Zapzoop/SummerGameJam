extends Node2D

var finished = preload("res://Mechanics/finished_product.tscn")

var ingredients = []
var ing = ["stick","iron","rope"]
var items =  [["wood stick","chestplate","whip"],
			 	["magic sword","shield","boots"],
				["nunjaku","gauntlets",",magic cap"]]

func craft_item(ingredient):
	ingredients.append(ingredient)
	if len(ingredients) == 2:
		var f = finished.instantiate()
		var created = items[ing.find(ingredients[1],0)][ing.find(ingredients[0],0)]
		globals.item_inventory.append(created)
		
		
		add_child(f)
		f.get_child(1).play("new_animation")
		f.what_am_i(created,"item")
		ingredients.clear()
