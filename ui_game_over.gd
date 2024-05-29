extends Control

@onready var canvas_layer = $CanvasLayer
@onready var respawn_sfx = $"Respawn SFX"

func _ready():
	canvas_layer.visible = false
	
func when_player_dead():
	canvas_layer.visible = true
	
func _on_touch_screen_button_pressed():
	get_tree().reload_current_scene()
