extends CanvasLayer

var portal = preload("res://Mechanics/Portal/portal.tscn")

@onready var small_attack = $attack1_cd
@onready var big_attack = $attack2_cd

# Called when the node enters the scene tree for the first time.
func _ready():
	Autoload.gui = self
	Autoload.small_attack = small_attack
	Autoload.big_attack = big_attack
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func close_portal():
	var node = get_child(-1)
	node.queue_free()
	$Portal.show()

func _on_button_pressed():
	var ins = portal.instantiate()
	$Portal.hide()
	self.add_child(ins)
	
