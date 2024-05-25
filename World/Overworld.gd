extends Node2D

var player = preload("res://Player/player.tscn")

var chapter2_lock = true
var chapter3_lock = true

@onready var progress = $"../GUI/Progress"

@onready var spawn_o1 = $Chapter1/Spawn_O1
@onready var spawn_o2 = $Chapter2/Spawn_O2
@onready var spawn_o3 = $Chapter3/Spawn_O3


func stop_chapter1():
	progress.hide()

func _ready():
	Autoload.overworld = self
	init_spawn()

func init_spawn():
	var spawn_in = Autoload.spawn_to
	match spawn_in:
		"o1":
			var ins = player.instantiate()
			self.add_child(ins)
			ins.whereami = "O1"
			ins.global_position = spawn_o1.global_position
		"o2":
			var ins = player.instantiate()
			self.add_child(ins)
			ins.whereami = "O2"
			ins.global_position = spawn_o2.global_position
		"o3":
			var ins = player.instantiate()
			self.add_child(ins)
			ins.whereami = "O3"
			ins.global_position = spawn_o3.global_position


func _on_O_chapter_1_body_entered(body):
	if body.is_in_group("player"):
		Autoload.player.whereami = "O1"
		print("Player entered Overworld Chapter 1")


func _on_O_chapter_2_body_entered(body):
	if body.is_in_group("player"):
		Autoload.player.whereami = "O2"
		print("Player entered Overworld Chapter 2")


func _on_O_chapter_3_body_entered(body):
	if body.is_in_group("player"):
		Autoload.player.whereami = "O3"
		print("Player entered Overworld Chapter 3")
