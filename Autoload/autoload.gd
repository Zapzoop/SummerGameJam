extends Node

signal playeradded

var overworld
var underworld
var gui

var small_attack
var big_attack

var player

var spawn_to

func big_attack_done(attack_to):
	if attack_to != null:
		attack_to.hit_big()
	big_attack.cooldown_sprite.show()
	big_attack.start_cooldown()

func small_attack_done(attack_to):
	if attack_to != null:
		attack_to.hit_small()
	small_attack.cooldown_sprite.show()
	small_attack.start_cooldown()

func close_screen_portal():
	gui.close_portal()

func emit_signal_player_added():
	emit_signal("playeradded")

func portal_completed():
	var player_at = player.whereami
	
	var O1 = overworld.spawn_o1
	var O2 = overworld.spawn_o2
	var O3 = overworld.spawn_o3
	
	var U1 = underworld.spawn_u1
	var U2 = underworld.spawn_u2
	var U3 = underworld.spawn_u3
	
	match player_at:
		"O1":
			player.global_position = U1.global_position
			underworld.start_chapter1()
			player.whereami = "U1"
		"O2":
			player.global_position = U2.global_position
			player.whereami = "U2"
		"O3":
			player.global_position = U3.global_position
			player.whereami = "U3"
		"U1":
			player.global_position = O1.global_position
			overworld.stop_chapter1()
			player.whereami = "O1"
		"U2":
			player.global_position = O2.global_position
			player.whereami = "O2"
		"U3":
			player.global_position = O3.global_position
			player.whereami = "O3"

func player_can_attack():
	player.can_attack = true

func player_can_not_attack():
	player.can_attack = false
