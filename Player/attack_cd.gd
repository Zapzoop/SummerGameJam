extends TextureRect

var can_attack = true
@onready var cooldown_sprite = $ColorRect

func _ready():
	if self.name == "attack1_cd":
		$timer.wait_time = 3
		$cd.text = "E"
	if self.name == "attack2_cd":
		$timer.wait_time = 5
		$cd.text = "Q"

func start_cooldown():
	$timer.start()
	if self.name == "attack1_cd":
		$AnimationPlayer.play("small_attack")
	else:
		$AnimationPlayer.play("big_attack")
	$cd.show()
	Autoload.player_can_not_attack()
	

func _on_timer_timeout():
	Autoload.player_can_attack()
