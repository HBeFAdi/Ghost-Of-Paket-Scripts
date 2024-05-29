extends Control

@onready var canvas_layer = $CanvasLayer
@onready var pause_ui = $"CanvasLayer/Pause UI"
@onready var utama = $CanvasLayer/Utama
@onready var pause = $CanvasLayer/Pause

func _ready():
	pause_ui.visible = false
	
func when_player_dead_1():
	canvas_layer.visible = false
	
func _on_left_arrow_pressed():
	Input.action_press("left")
func _on_left_arrow_released():
	Input.action_release("left")

func _on_right_arrow_pressed():
	Input.action_press("right")
func _on_right_arrow_released():
	Input.action_release("right")
	
func _on_jump_arrow_pressed():
	global.is_still_jump = true
	Input.action_press("jump")
func _on_jump_arrow_released():
	global.is_still_jump = false
	Input.action_release("jump")

func _on_attack_button_pressed():
	Input.action_press("attack")
func _on_attack_button_released():
	Input.action_release("attack")

func _on_pause_pressed():
	pause_ui.visible = true
	utama.visible = false

func _on_return_main_menu_pressed():
	Transition.transition()
	await Transition.on_transition_finished
	get_tree().change_scene_to_file("res://Scene/main_menu.tscn")

func _on_resume_pressed():
	pause_ui.visible = false
	utama.visible = true

func _on_restart_pressed():
	get_tree().reload_current_scene()

func hilang():
	$CanvasLayer.visible = false
