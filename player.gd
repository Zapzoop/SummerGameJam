extends CharacterBody2D

#setup variables
const speed = 300
var clicked_pos = Vector2()
var target_position = Vector2()
var moba:bool = true

# Called when the node enters the scene tree for the first time.
func _ready():
	clicked_pos = position

func _process(delta):
	if Input.is_action_just_pressed("attack1") and $attack1_cd.can_attack:
		$attack1_cd.attack()
	if Input.is_action_just_pressed("attack2") and $attack2_cd.can_attack:
		$attack2_cd.attack()
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if moba:
		if Input.is_action_just_pressed("mouse_left"):
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
	
	move_and_slide()
	
