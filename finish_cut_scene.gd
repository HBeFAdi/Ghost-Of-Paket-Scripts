extends CanvasLayer

@onready var player_box = $"Player box"
@onready var priest_box = $"Priest box"
@onready var player_animation = $"Player Animation"
@onready var priest_animation = $"Priest Animation"
@onready var player_text = $"Player box/Player text"
@onready var priest_text = $"Priest box/Priest text"
@onready var thanks_for_playing = $"../Thanks For Playing"
@onready var skip = $Skip

var apakah_diskip = false
	
func _ready():
	if apakah_diskip == false:
		player_box.visible = false
		priest_box.visible = false
		skip.visible = false
		
func finish_cut_scene_mulai():
	if apakah_diskip == false:
		skip.visible = true
		player_box.visible = false
		priest_box.visible = true
		priest_animation.play("Priest_In")
		priest_text.text = "HA HA HA HA HA"
		$"Priest box/Text1".start()
	
func player_in():
	if apakah_diskip == false:
		player_box.visible = true
		priest_box.visible = false
		player_animation.play("Player_In")
		priest_animation.play("Priest_Out")
	
func priest_in():
	if apakah_diskip == false:
		player_box.visible = false
		priest_box.visible = true
		player_animation.play("Player_Out")
		priest_animation.play("Priest_In")
	
func _on_text_1_timeout():
	if apakah_diskip == false:
		$"Priest box/Text1".stop()
		priest_text.text = "SELAMAT DATANG WAHAI ANAK MUDA!"
		$"Player box/Text2".start()
	
func _on_text_2_timeout():
	if apakah_diskip == false:
		$"Player box/Text2".stop()
		player_in()
		player_text.text = "HAH!!! Kenapa kamu bisa ada disini?"
		$"Priest box/Text3".start()

func _on_text_3_timeout():
	if apakah_diskip == false:
		$"Priest box/Text3".stop()
		priest_in()
		priest_text.text = "Sebenarnya selama ini saya sudah berada disini"
		$"Priest box/Text4".start()
	
func _on_text_4_timeout():
	if apakah_diskip == false:
		$"Priest box/Text4".stop()
		priest_text.text = "Sudah. Mana cepat barang saya! Saya sudah lama menunggunya!"
		$"Player box/Text5".start()
	
func _on_text_5_timeout():
	if apakah_diskip == false:
		$"Player box/Text5".stop()
		player_in()
		player_text.text = "Tapi, jika kau membutuhkan barang ini dari tadi"
		$"Player box/Text6".start()
	
func _on_text_6_timeout():
	if apakah_diskip == false:
		$"Player box/Text6".stop()
		player_text.text = "Mengapa kau tidak membawanya sendiri?"
		$"Priest box/Text7".start()
	
func _on_text_7_timeout():
	if apakah_diskip == false:
		$"Priest box/Text7".stop()
		priest_in()
		priest_text.text = "Sebenarnya..."
		$"Priest box/Text8".start()
	

func _on_text_8_timeout():
	if apakah_diskip == false:
		$"Priest box/Text8".stop()
		priest_text.text = "Saya cuma gabut."
		$"Player box/Text9".start()

func _on_text_9_timeout():
	if apakah_diskip == false:
		$"Player box/Text9".stop()
		player_in()
		player_text.text = "APA!!!"
		$"Priest box/Text10".start()

func _on_text_10_timeout():
	if apakah_diskip == false:
		$"Priest box/Text10".stop()
		priest_in()
		priest_text.text = "Duit saya terlalu banyak, makanya saya menyuruh kamu untuk mengantarkan barang ini."
		$"Priest box/Text11".start()
	
func _on_text_11_timeout():
	if apakah_diskip == false:
		$"Priest box/Text11".stop()
		priest_text.text = "BTW, ini upahmu. 100 Triliun Dolar Zimbabwe. HEHE"
		$"Player box/Text12".start()
	
func _on_text_12_timeout():
	if apakah_diskip == false:
		$"Player box/Text12".stop()
		player_in()
		player_text.text = "Ok"
		$"Priest box/Text13".start()
	
func _on_text_13_timeout():
	if apakah_diskip == false:
		$"Priest box/Text13".stop()
		priest_in()
		priest_text.text = "Sudah berakhir perjalananmu. Saatnya aku pergi. BYE"
		$"Priest box/Finish".start()

func _on_finish_timeout():
	if apakah_diskip == false:
		$"Priest box/Finish".stop()
		player_box.visible = false
		priest_box.visible = false
		priest_animation.play("Priest_Out")
		thanks_for_playing.thanks_for_playing_mulai()

func _on_skip_button_pressed():
	skip.visible = false
	apakah_diskip = true
	player_box.visible = false
	priest_box.visible = false
	$Player.visible = false
	$Priest.visible = false
	thanks_for_playing.thanks_for_playing_mulai()
