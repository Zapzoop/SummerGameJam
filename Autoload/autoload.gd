extends Node

var overworld
var underworld
var gui

var player

var spawn_to

func close_screen_portal():
	gui.close_portal()

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
			player.reparent_me(underworld)
			player.global_position = U1.global_position
			player.whereami = "U1"
		"O2":
			player.reparent_me(underworld)
			player.global_position = U2.global_position
			player.whereami = "U2"
		"O3":
			player.reparent_me(underworld)
			player.global_position = U3.global_position
			player.whereami = "U3"
		"U1":
			player.reparent_me(overworld)
			player.global_position = O1.global_position
			player.whereami = "O1"
		"U2":
			player.reparent_me(overworld)
			player.global_position = O2.global_position
			player.whereami = "O2"
		"U3":
			player.reparent_me(overworld)
			player.global_position = O3.global_position
			player.whereami = "O3"
