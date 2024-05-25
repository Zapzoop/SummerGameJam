extends Node2D

@onready var spawn_u1 = $Chapter1/Spawn_U1
@onready var spawn_u2 = $Chapter2/Spawn_U2
@onready var spawn_u3 = $Chapter3/Spawn_U3

@onready var O_chapter2blocker = $"../Overworld/Chapter2/Chapter2_Blocker"
@onready var O_chapter3blocker = $"../Overworld/Chapter3/Chapter3_Blocker"

@onready var U_chapter2blocker = $Chapter2/StaticBody2D
@onready var U_chapter3blocker = $Chapter3/StaticBody2D

@onready var progress = $"../GUI/Progress"

var enemy = preload("res://Enemy/enemy.tscn")

@onready var U1_faction1 = $Chapter1/Faction1
@onready var U1_faction2 = $Chapter1/Faction2
@onready var U1_faction3 = $Chapter1/Faction3
@onready var U1_faction4 = $Chapter1/Faction4

@onready var U2_faction5 = $Chapter2/Faction5
@onready var U2_faction6 = $Chapter2/Faction6
@onready var U2_faction7 = $Chapter2/Faction7
@onready var U2_faction8 = $Chapter2/Faction8

@onready var U3_faction9 = $Chapter3/Faction9
@onready var U3_faction10 = $Chapter3/Faction10
@onready var U3_faction11 = $Chapter3/Faction11
@onready var U3_faction12 = $Chapter3/Faction12

var total_enemies = 0
var total_active_factions = []

var U1_factions = [1,2,3,4]
var U2_factions = [5,6,7,8]
var U3_factions = [9,10,11,12]

var active_U1_factions = []
var active_U2_factions = []
var active_U3_factions = []

func _ready():
	Autoload.underworld = self
	Autoload.playeradded.connect(_on_player_added)
	select_random(1)
	select_random(2)
	select_random(3)
	total_active_factions.append_array(active_U1_factions)
	total_active_factions.append_array(active_U2_factions)
	total_active_factions.append_array(active_U3_factions)
	total_active_factions.sort()
	print(total_active_factions)
	#print(active_U1_factions)
	print(total_enemies)

func select_random(chapter):
	var number_of_factions = randi_range(1,3) 
	match chapter:
		1:
			for i in range(number_of_factions):
				var faction = U1_factions.pick_random()
				U1_factions.erase(faction)
				active_U1_factions.append(faction)
				match faction:
					1:
						create_factions(U1_faction1,chapter)
					2:
						create_factions(U1_faction2,chapter)
					3:
						create_factions(U1_faction3,chapter)
					4:
						create_factions(U1_faction4,chapter)
		2:
			for i in range(number_of_factions):
				var faction = U2_factions.pick_random()
				U2_factions.erase(faction)
				active_U2_factions.append(faction)
				match faction:
					5:
						create_factions(U2_faction5,chapter)
					6:
						create_factions(U2_faction6,chapter)
					7:
						create_factions(U2_faction7,chapter)
					8:
						create_factions(U2_faction8,chapter)
		3:
			for i in range(number_of_factions):
				var faction = U3_factions.pick_random()
				U3_factions.erase(faction)
				active_U3_factions.append(faction)
				match faction:
					9:
						create_factions(U3_faction9,chapter)
					10:
						create_factions(U3_faction10,chapter)
					11:
						create_factions(U3_faction11,chapter)
					12:
						create_factions(U3_faction12,chapter)
	
func create_factions(node,chapter):
	var number_of_enemies = randi_range(2,3) 
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
				add_player_variable(U1_faction1)
			2:
				add_player_variable(U1_faction2)
			3:
				add_player_variable(U1_faction3)
			4:
				add_player_variable(U1_faction4)
	for i in active_U2_factions:
		match i:
			5:
				add_player_variable(U2_faction5)
			6:
				add_player_variable(U2_faction6)
			7:
				add_player_variable(U2_faction7)
			8:
				add_player_variable(U2_faction8)
	for i in active_U3_factions:
		match i:
			9:
				add_player_variable(U3_faction9)
			10:
				add_player_variable(U3_faction10)
			11:
				add_player_variable(U3_faction11)
			12:
				add_player_variable(U3_faction12)
	
func _on_player_added():
	update_player()

func unlock_chapter2():
	progress.text = "All Factions are defeated!"
	if U_chapter2blocker != null:
		U_chapter2blocker.queue_free()
		O_chapter2blocker.queue_free()

func unlock_chapter3():
	progress.text = "All Factions are defeated!"
	if U_chapter3blocker != null:
		U_chapter3blocker.queue_free()
		O_chapter3blocker.queue_free()

func check_progress(player_pos):
	match player_pos:
		"U1":
			for i in active_U1_factions:
				match i:
					1:
						if U1_faction1.get_child_count() == 0:
							active_U1_factions.erase(1)
							start_chapter1()
					2:
						if U1_faction2.get_child_count() == 0:
							active_U1_factions.erase(2)
							start_chapter1()
					3:
						if U1_faction3.get_child_count() == 0:
							active_U1_factions.erase(3)
							start_chapter1()
					4:
						if U1_faction4.get_child_count() == 0:
							active_U1_factions.erase(4)
							start_chapter1()
			if active_U1_factions.size() == 0:
				unlock_chapter2()
		"U2":
			for i in active_U2_factions:
				match i:
					5:
						if U2_faction5.get_child_count() == 0:
							active_U2_factions.erase(5)
							start_chapter2()
					6:
						if U2_faction6.get_child_count() == 0:
							active_U2_factions.erase(6)
							start_chapter2()
					7:
						if U2_faction7.get_child_count() == 0:
							active_U2_factions.erase(7)
							start_chapter2()
					8:
						if U2_faction8.get_child_count() == 0:
							active_U2_factions.erase(8)
							start_chapter2()
			if active_U2_factions.size() == 0:
				unlock_chapter3()
		"U3":
			for i in active_U3_factions:
				match i:
					9:
						if U3_faction9.get_child_count() == 0:
							active_U3_factions.erase(9)
							start_chapter3()
					10:
						if U3_faction10.get_child_count() == 0:
							active_U2_factions.erase(10)
							start_chapter3()
					11:
						if U3_faction11.get_child_count() == 0:
							active_U3_factions.erase(11)
							start_chapter3()
					12:
						if U3_faction12.get_child_count() == 0:
							active_U3_factions.erase(12)
							start_chapter3()
			if active_U3_factions.size() == 0:
				load_win_screen()
			

func _process(delta):
	if Autoload.player.whereami in ["U1","U2","U3"]: 
		check_progress(Autoload.player.whereami)
	else:
		progress.hide()

func start_chapter1():
	var remaining = active_U1_factions.size()
	progress.text = "Factions Remaining: " + str(remaining)
	progress.show()
	
func start_chapter2():
	var remaining = active_U2_factions.size()
	progress.text = "Factions Remaining: " + str(remaining)
	progress.show()
	
func start_chapter3():
	var remaining = active_U3_factions.size()
	progress.text = "Factions Remaining: " + str(remaining)
	progress.show()

func load_win_screen():
	pass


func _on_U_chapter_1_body_entered(body):
	if body.is_in_group("player"):
		Autoload.player.whereami = "U1"
		print("Player entered Underworld Chapter 1")


func _on_U_chapter_2_body_entered(body):
	if body.is_in_group("player"):
		Autoload.player.whereami = "U2"
		print("Player entered Underworld Chapter 2")


func _on_U_chapter_3_body_entered(body):
	if body.is_in_group("player"):
		Autoload.player.whereami = "U3"
		print("Player entered Underworld Chapter 3")
