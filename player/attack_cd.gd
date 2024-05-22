extends Sprite2D

var can_attack = true

# Called when the node enters the scene tree for the first time.
func _ready():
	if self.name == "attack1_cd":
		$timer.wait_time = 3
	if self.name == "attack2_cd":
		$timer.wait_time = 5


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$cd.text = str(int($timer.time_left))


func attack():
	$timer.start()
	$cd.show()
	self.can_attack = false
	

func _on_timer_timeout():
	$cd.hide()
	self.can_attack = true
