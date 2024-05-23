extends Node2D

@onready var spawn_u1 = $Chapter1/Spawn_U1
@onready var spawn_u2 = $Chapter2/Spawn_U2
@onready var spawn_u3 = $Chapter3/Spawn_U3


# Called when the node enters the scene tree for the first time.
func _ready():
	Autoload.underworld = self


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
