extends Node2D

var ingredients = []

func craft_pot(ingredient):
	ingredients.append(ingredient)
	if len(ingredients) == 2:
		pass
