extends Node2D

var player = preload("res://Player/player.tscn")

var chapter2_lock = true
var chapter3_lock = true

@onready var spawn_o1 = $Chapter1/Spawn_O1
@onready var spawn_o2 = $Chapter2/Spawn_O2
@onready var spawn_o3 = $Chapter3/Spawn_O3

# Called when the node enters the scene tree for the first time.
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
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
