extends CharacterBody2D

const ACCELERATION = 250

var shader_to_load = load("res://Enemy/enemy.tres")

@onready var sprite_to_add_shader =$sprite 

var races = ["zombie","skeleton","vampire","demon"]
var enemies = []
var ally = []

var race:String
var max_health:int
var current_heath:int
var attack:int
var speed:int
var target_pos = Vector2()
var friction = 5
var player = Autoload.player

var triggered:bool = false
var should_move = true

var wanderrange = 100
var start_position = global_position

var state = IDLE
@onready var wandertime = $wandertime
enum {
	IDLE,
	WANDER,
	CHASE,
	RETREAT
}

var player_visible = false

# Called when the node enters the scene tree for the first time.
func _ready():
	highlight_me()
	change_state([IDLE,WANDER])	
	self.race = "zombie"
	if self.race == "zombie":
		create_zombie()
	elif self.race == "skeleton":
		create_skeleton()
	elif self.race == "vampire":
		create_vampire()
	elif self.race == "demon":
		create_demon()
	
	#current_heath = max_health * 0.1
	#deactivate_hitboxes()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func sprite_alignment():
	if velocity.x > 0:
		$sprite.play(race+ "_" + "walkX")
	elif velocity.x < 0:
		$sprite.play(race+ "_" + "walkX")
		$sprite.flip_h = true
	elif velocity.y > 0:
		$sprite.play(race+ "_" + "up")
	elif velocity.y < 0:
		$sprite.play(race+"_" + "down")

func _physics_process(delta):
	match state:
		IDLE:
			var deceleration = friction * delta
			velocity = velocity.move_toward(Vector2.ZERO, deceleration)
		WANDER:
			accelerate_towards_point(target_pos,delta,speed * 0.6)
		CHASE:
			if global_position.distance_to(player.global_position) > 3 and should_move:
				target_pos = (player.global_position - global_position).normalized()
				velocity = target_pos * speed * 2
			sprite_alignment()
		RETREAT:
			if global_position.distance_to(player.global_position) < 300:
				target_pos = (player.global_position - global_position).normalized()
				velocity = -target_pos * speed * 0.4 * 2
	move_and_slide()


func _on_trigger_body_entered(body):
	if body.is_in_group("interactable"):
		if body.is_in_group("player"):
			player_visible = true
		if body.race in enemies:
			if current_heath < max_health * 0.2:
				state = RETREAT
			else:
				state = CHASE
			wandertime.stop()
			print("sium")

func _on_trigger_body_exited(body):
	if body.is_in_group("interactable"):
		if body.is_in_group("player"):
			player_visible = false
		if body.race in enemies:
			change_state([IDLE])
			wandertime.start()

func create_zombie():
	self.max_health = 50
	self.current_heath = self.max_health
	self.attack = 50
	self.speed = 50
	#self.modulate = "3b8431"
	self.enemies = ["demon"]
	self.ally = ["zombie","skeleton"]
	

func create_skeleton():
	self.max_health = 15
	self.current_heath = self.max_health
	self.attack = 90
	self.speed = 45
	#self.modulate = "e5e5e6"
	self.enemies = ["vampires"]
	self.ally = ["zombie","skeleton"]

func create_demon():
	self.max_health = 100
	self.current_heath = self.max_health
	self.attack = 30
	self.speed = 20
	#self.modulate = "e84366"
	self.enemies = ["zombies","vampires"]
	self.ally = ["demon"]

func create_vampire():
	self.max_health = 30
	self.current_heath = self.max_health
	self.attack = 40
	self.speed = 70
	#self.modulate = "916ee8"
	self.enemies = ["skeleton","demon"]
	self.ally = ["vampire"]
	
func deactivate_hitboxes():
	var children = get_children()
	for c in range(4,len(children)):
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

func pick_random_state(state_list):
	return state_list.pick_random()

func update_wander_range():
	var target_position = Vector2(randi_range(-wanderrange,wanderrange),randi_range(-wanderrange,wanderrange))
	target_pos = start_position+target_position
	#print(target_pos)

func adjust_timer():
	wandertime.wait_time = randi_range(2,4)
	wandertime.start()

func change_state(state_list):
	state = pick_random_state(state_list)

func _on_wandertime_timeout():
	change_state([IDLE,WANDER])
	if state == WANDER:
		update_wander_range()
	adjust_timer()

func accelerate_towards_point(point, delta, MAX_SPEED):
	var direction = global_position.direction_to(point)
	velocity = velocity.move_toward(direction * MAX_SPEED, ACCELERATION * delta)
	#print(velocity)

func highlight_me():
	var material_new = ShaderMaterial.new()
	material_new.shader = shader_to_load
	$sprite.set_material(material_new)

func unhighlight_me():
	$sprite.set_material(null)
