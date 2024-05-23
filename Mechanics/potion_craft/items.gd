extends Node2D

@onready var i =  preload("res://Mechanics/potion_craft/ingredient.tscn")
# Called when the node enters the scene tree for the first time.
func _ready():
	var pos = 0
	#for ing in globals.potion_ingredients.keys():
	var g = i.instantiate()
	add_child(g)
	g.pass_name("bello")
	g.position.y = pos
	g.initial_pos.y = pos
	pos += 150
		


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
