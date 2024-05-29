extends Node

@onready var start = $Start
@onready var story_text = $"Story box/Story Text"
@onready var story_box = $"Story box"
@onready var scene_1 = $Scene1
@onready var player_animation = $"Scene/Player Animation"
@onready var player_text = $"Scene/Player box/Player text"
@onready var player_box = $"Scene/Player box"
@onready var priest_animation = $"Scene/Priest Animation"
@onready var priest_box = $"Scene/Priest box"
@onready var priest_text = $"Scene/Priest box/Priest text"

func _ready():
	priest_box.visible = false
	player_box.visible = false
	start.start()
	
func _on_start_timeout():
	start.stop()
	story_text.text = "Kisah ini berawal dari seorang pemuda pengangguran yang bingung akan ekonominya dan diambang hidupnya ada seorang priest yang tiba tiba muncul di hadapannya menawari sebuah pekerjaan. Tentu pekerjaan itu tidaklah mudah, ada resikonya."
	scene_1.start()

func _on_scene_1_timeout():
	scene_1.stop()
	story_box.visible = false
	player_box.visible = true
	player_animation.play("Player_In")
	player_text.text = "Adohh, akhir bulan gini, duit makin menipis, nyari kerjaan susah amat ya!"
	$"Scene/Player box/Text1".start()

func _on_text_1_timeout():
	$"Scene/Player box/Text1".stop()
	player_text.text = "Kalau gua dapet kerjaan, bodo amat langsung tak terima, bodo amat resikonya!"
	$"Scene/Player box/Text2".start()

func _on_text_2_timeout():
	$"Scene/Player box/Text2".stop()
	player_animation.play("Player_Out")
	priest_animation.play("Priest_In")
	player_box.visible = false
	priest_box.visible = true
	priest_text.text = "HA HA HA HA HA HA HA"
	$"Scene/Priest box/Text3".start()

func _on_text_3_timeout():
	$"Scene/Priest box/Text3".stop()
	priest_text.text = "Saya punya pekerjaan untuk anda. Anda harus mengantarkan paket ini ke tempat tujuan."
	$"Scene/Priest box/Text4".start()
	
func _on_text_4_timeout():
	$"Scene/Priest box/Text4".stop()
	priest_text.text = "Tapi ingat bahwa perjalanan ini tidaklah mudah, anda harus melewati berbagai rintangan yang ada."
	$"Scene/Player box/Text5".start()

func _on_text_5_timeout():
	$"Scene/Player box/Text5".stop()
	player_animation.play("Player_In")
	priest_animation.play("Priest_Out")
	player_box.visible = true
	priest_box.visible = false
	player_text.text = "Hah! Yang bener, saya terima pekerjaannya. Bodo amat gua butuh duit"
	$"Scene/Priest box/Text6".start()
	
func _on_text_6_timeout():
	$"Scene/Priest box/Text6".stop()
	player_animation.play("Player_Out")
	priest_animation.play("Priest_In")
	player_box.visible = false
	priest_box.visible = true
	priest_text.text = "Baiklah kalau begitu. Saya akan memberikan imbalannya jika kamu berhasil mengantarkan paket ini."
	$"Scene/Priest box/Text7".start()

func _on_text_7_timeout():
	$"Scene/Priest box/Text7".stop()
	priest_text.text = "SELAMAT BERJUANG!!!"
	$"Scene/Priest box/Finish".start()
	
func _on_text_8_timeout():
	$"Scene/Priest box/Finish".stop()
	Transition.transition()
	await Transition.on_transition_finished
	get_tree().change_scene_to_file("res://Scene/main.tscn")

func _on_skip_button_pressed():
	$"Skip SFX".play()
	Transition.transition()
	await Transition.on_transition_finished
	get_tree().change_scene_to_file("res://Scene/main.tscn")
