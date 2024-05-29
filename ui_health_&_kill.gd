extends Control

@onready var Health = $"CanvasLayer/Health UI/Label"
@onready var Kill = $"CanvasLayer/Kill UI/Label"
@onready var timer = $CanvasLayer/Timer
@onready var time = $CanvasLayer/Timer/Time

var health = 100
var kill = 0
var waktu = 0

func _ready():
	global.apakah_masih_speedrun = true
	if global.speedrun_mode == true:
		timer.visible = true
		$CanvasLayer/Timer/Batasan.start()
	else:
		timer.visible = false
		
func _process(delta):
	$"CanvasLayer/FPS Counter".text = "FPS : " + str(Engine.get_frames_per_second())
	
func minus_health():
	health = health - global.damage_to_player
	if health < 0:
		health = 0
	Health.text = "HEALTH : " + str(health)
	
func add_kill():
	kill = kill + 1
	Kill.text = "Kill : " + str(kill)
	
func get_heal_potion():
	health = health + global.heal_point
	if health >= 100:
		health = 100
	Health.text = "Health : " + str(health)

func hilang():
	$CanvasLayer.visible = false

func _on_batasan_timeout():
	$CanvasLayer/Timer/Batasan.stop()
	if global.apakah_masih_speedrun == true:
		waktu = waktu + 0.1
		global.total_waktu = "%0.1f" % waktu
		time.text = str(global.total_waktu)
		print(global.total_waktu)
	else:
		time.text = str(global.total_waktu)
	$CanvasLayer/Timer/Batasan2.start()

func _on_batasan_2_timeout():
	$CanvasLayer/Timer/Batasan2.stop()
	if global.apakah_masih_speedrun == true:
		waktu = waktu + 0.1
		global.total_waktu = "%0.1f" % waktu
		time.text = str(global.total_waktu)
		print(global.total_waktu)
	else:
		time.text = str(global.total_waktu)
	$CanvasLayer/Timer/Batasan.start()
