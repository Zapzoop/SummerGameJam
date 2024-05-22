extends CharacterBody2D

var races = ["zombie","skeleton","vampire","demon"]
var enemies = []
var ally = []

var race:String
var health:int
var attack:int
var speed:int
var target_pos = Vector2()
@onready var player = $/root/test_area/player

var triggered:bool = false
var should_move = false

# Called when the node enters the scene tree for the first time.
func _ready():
	self.race = "zombie"
	if self.race == "zombie":
		create_zombie()
	elif self.race == "skeleton":
		create_skeleton()
	elif self.race == "vampire":
		create_vampire()
	elif self.race == "demon":
		create_demon()
	
	deactivate_hitboxes()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _physics_process(delta):
	if triggered:
		
		if position.distance_to(player.position) > 3 and should_move:
			target_pos = (player.position - position).normalized()
			velocity = target_pos * speed * 2
		if velocity.x > 0:
			$sprite.play(race+ "_" + "walkX")
		elif velocity.x < 0:
			$sprite.play(race+ "_" + "walkX")
			$sprite.flip_h = true
		elif velocity.y > 0:
			$sprite.play(race+ "_" + "up")
		elif velocity.y < 0:
			$sprite.play(race+"_" + "down")
		
	move_and_slide()



func _on_trigger_body_entered(body):
	if body.race in enemies:
		triggered = true
		print("sium")

func create_zombie():
	self.health = 50
	self.attack = 50
	self.speed = 50
	self.modulate = "3b8431"
	self.enemies = ["demon"]
	self.ally = ["zombie","skeleton"]
	

func create_skeleton():
	self.health = 15
	self.attack = 90
	self.speed = 45
	self.modulate = "e5e5e6"
	self.enemies = ["vampires"]
	self.ally = ["zombie","skeleton"]

func create_demon():
	self.health = 100
	self.attack = 30
	self.speed = 20
	self.modulate = "e84366"
	self.enemies = ["zombies","vampires"]
	self.ally = ["demon"]

func create_vampire():
	self.health = 30
	self.attack = 40
	self.speed = 70
	self.modulate = "916ee8"
	self.enemies = ["skeleton","demon"]
	self.ally = ["vampire"]
	
func deactivate_hitboxes():
	var children = get_children()
	for c in range(3,len(children)):
		if children[c].name != race+"_ability1_range" or race+"_ability2_range":
			children[c].monitoring = false
		

func _on_zombie_ability_1_range_body_entered(body):
	pass # Replace with function body.


func _on_zombie_ability_2_range_body_entered(body):
	pass # Replace with function body.


func _on_vampire_ability_1_range_body_entered(body):
	pass # Replace with function body.


func _on_vampire_ability_2_range_body_entered(body):
	pass # Replace with function body.


func _on_skeleton_ability_1_range_body_entered(body):
	pass # Replace with function body.


func _on_skeleton_ability_2_range_body_entered(body):
	pass # Replace with function body.


func _on_demon_ability_1_range_body_entered(body):
	pass # Replace with function body.


func _on_demon_ability_2_range_body_entered(body):
	pass # Replace with function body.


func _on_zombie_ability_1_range_body_exited(body):
	pass # Replace with function body.


func _on_zombie_ability_2_range_body_exited(body):
	pass # Replace with function body.


func _on_vampire_ability_1_range_body_exited(body):
	pass # Replace with function body.


func _on_vampire_ability_2_range_body_exited(body):
	pass # Replace with function body.


func _on_skeleton_ability_1_range_body_exited(body):
	pass # Replace with function body.


func _on_skeleton_ability_2_range_body_exited(body):
	pass # Replace with function body.


func _on_demon_ability_1_range_body_exited(body):
	pass # Replace with function body.


func _on_demon_ability_2_range_body_exited(body):
	pass # Replace with function body.
