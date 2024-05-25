extends CharacterBody2D

#setup variables
const speed = 300
var clicked_pos = Vector2()
var target_position = Vector2()
var moba:bool = false

var inside_range = []
var super_closest

var whereami

var can_attack = true

var race:String = "demon"

func _ready():
	clicked_pos = position
	Autoload.player = self
	Autoload.emit_signal_player_added()

func _input(event):
	if can_attack == true and Input.is_action_just_pressed("big_attack"):
		Autoload.big_attack_done(super_closest)
	if can_attack == true and Input.is_action_just_pressed("small_attack"):
		Autoload.small_attack_done(super_closest)

func _physics_process(delta):
	if moba:
		if Input.is_action_just_pressed("left_mouse"):
			clicked_pos = get_global_mouse_position()
		if position.distance_to(clicked_pos) > 3:
			target_position = (clicked_pos - position).normalized()
			velocity = target_position * speed
		else:
			velocity.x = 0
			velocity.y = 0
	elif moba == false:
		if Input.is_action_pressed("up"):
			velocity.y = speed * -1
		elif Input.is_action_pressed("down"):
			velocity.y = speed
		elif Input.is_action_pressed("left"):
			velocity.x = speed * -1
		elif Input.is_action_pressed("right"):
			velocity.x = speed
		else:
			velocity.x = 0
			velocity.y = 0
			
		if Input.is_action_just_released("up") or Input.is_action_just_released("down"):
			velocity.y = 0
		if Input.is_action_just_released("left") or Input.is_action_just_released("right"):
			velocity.x = 0
	
	if !inside_range.is_empty():
		var closest = closest_entity()
		if super_closest == null:
			super_closest = closest
			super_closest.highlight_me()
			return
		
		if closest != super_closest:
			super_closest.unhighlight_me()
			closest.highlight_me()
			super_closest = closest
	move_and_slide()
	

func closest_entity():
	var smallest_dis = null
	var closest_body = null
	for i in inside_range:
		var distance = global_position.distance_to(i.global_position)
		if smallest_dis == null or distance < smallest_dis:
			smallest_dis = distance
			closest_body = i
	return closest_body

func _on_attack_radius_body_entered(body):
	if body.is_in_group("interactable") and !body.is_in_group("player"):
		inside_range.append(body)


func _on_attack_radius_body_exited(body):
	if body.is_in_group("interactable")and !body.is_in_group("player"):
		body.unhighlight_me()
		super_closest = null
		inside_range.erase(body)
