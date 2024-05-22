extends Node2D

var player = preload("res://Player/player.tscn")

var chapter2_lock = true
var chapter3_lock = true

@onready var spawn_c1 = $Chapter1/Spawn_O1
@onready var spawn_c2 = $Chapter2/Spawn_O2
@onready var spawn_c3 = $Chapter3/Spawn_O3

# Called when the node enters the scene tree for the first time.
func _ready():
	Autoload.overworld = self
	init_spawn()

func init_spawn():
	var spawn_in = Autoload.spawn_to
	match spawn_in:
		"c1":
			var ins = player.instantiate()
			self.add_child(ins)
			ins.global_position = spawn_c1.global_position
		"c2":
			var ins = player.instantiate()
			self.add_child(ins)
			ins.global_position = spawn_c2.global_position
		"c3":
			var ins = player.instantiate()
			self.add_child(ins)
			ins.global_position = spawn_c3.global_position
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
