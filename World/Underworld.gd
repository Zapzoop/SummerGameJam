extends Node2D

@onready var spawn_u1 = $Chapter1/Spawn_U1
@onready var spawn_u2 = $Chapter2/Spawn_U2
@onready var spawn_u3 = $Chapter3/Spawn_U3

@onready var progress = $"../GUI/Progress"

var enemy = preload("res://Enemy/enemy.tscn")

@onready var faction1_U1 = $Chapter1/Faction1
@onready var faction1_U2 = $Chapter1/Faction2
@onready var faction1_U3 = $Chapter1/Faction3
@onready var faction1_U4 = $Chapter1/Faction4

var total_enemies = 0

var U1_factions = [1,2,3,4]

var active_U1_factions = []

# Called when the node enters the scene tree for the first time.
func _ready():
	Autoload.underworld = self
	Autoload.playeradded.connect(_on_player_added)
	select_random(1)
	

func select_random(chapter):
	var number_of_factions = randi_range(1,3) 
	for i in range(number_of_factions):
		var faction = U1_factions.pick_random()
		U1_factions.erase(faction)
		active_U1_factions.append(faction)
		match faction:
			1:
				create_factions(faction1_U1,chapter)
			2:
				create_factions(faction1_U2,chapter)
			3:
				create_factions(faction1_U3,chapter)
			4:
				create_factions(faction1_U4,chapter)
	print(active_U1_factions)
	print(total_enemies)
	
func create_factions(node,chapter):
	var number_of_enemies = randi_range(4,8) 
	total_enemies += number_of_enemies
	var available_enemies = []
	match chapter:
		1:
			available_enemies.append("demon")
		2:
			available_enemies.append("skeleton")
		3:
			available_enemies.append("vampires")

	for i in range(number_of_enemies):
		var ins = enemy.instantiate()
		ins.race = available_enemies.pick_random()
		node.add_child(ins)
	
	
func add_player_variable(node):
	for i in node.get_children():
		i.player = Autoload.player

func update_player():
	for i in active_U1_factions:
		match i:
			1:
				add_player_variable(faction1_U1)
			2:
				add_player_variable(faction1_U2)
			3:
				add_player_variable(faction1_U3)
			4:
				add_player_variable(faction1_U4)

func _on_player_added():
	update_player()

func check_progress():
	for i in active_U1_factions:
		match i:
			1:
				if faction1_U1.get_child_count() == 0:
					active_U1_factions.erase(1)
					start_chapter1()
			2:
				if faction1_U2.get_child_count() == 0:
					active_U1_factions.erase(2)
					start_chapter1()
			3:
				if faction1_U3.get_child_count() == 0:
					active_U1_factions.erase(3)
					start_chapter1()
			4:
				if faction1_U4.get_child_count() == 0:
					active_U1_factions.erase(4)
					start_chapter1()

func _process(delta):
	if Autoload.player.whereami in ["U1","U2","U3"]: 
		check_progress()

func start_chapter1():
	var remaining = active_U1_factions.size()
	progress.text = "Factions Remaining: " + str(remaining)
	progress.show()
