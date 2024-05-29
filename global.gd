extends Node

var player_current_attack = false
var enemy_dead = false
var damage_to_enemy = 0
var damage_to_player = 0
var heal_point = 0
var total_waktu = 0
var is_still_jump = false
var is_background = true
var is_props = true
var speedrun_mode = true
var apakah_masih_speedrun = true

func difficulty_easy():
	damage_to_enemy = 50
	damage_to_player = 5
	heal_point = 30

func difficulty_normal():
	damage_to_enemy = 50
	damage_to_player = 10
	heal_point = 30
	
func difficulty_hard():
	damage_to_enemy = 40
	damage_to_player = 20
	heal_point = 50

func difficulty_imposible():
	damage_to_enemy = 25
	damage_to_player = 50
	heal_point = 50
