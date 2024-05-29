extends Node

@onready var chose_difficulty = $"Chose Difficulty"
@onready var start = $Start
@onready var damage_info = $"Damage Info"
@onready var click = $Click
@onready var graphic_setting = $"Graphic Setting"
@onready var setting = $Setting
@onready var version = $Version
@onready var return_box = $"Return Box"
@onready var update = $Update

func _ready():
	chose_difficulty.visible = false
	damage_info.visible = false
	graphic_setting.visible = false
	update.visible = false
	return_box.visible = false
	
func _on_play_button_pressed():
	click.play()
	chose_difficulty.visible = true
	damage_info.visible = true
	start.visible = false
	setting.visible = false
	version.visible = false

func _on_easy_pressed():
	click.play()
	global.difficulty_easy()
	Transition.transition()
	await Transition.on_transition_finished
	get_tree().change_scene_to_file("res://Scene/cut_scene_story.tscn")

func _on_normal_pressed():
	click.play()
	global.difficulty_normal()
	Transition.transition()
	await Transition.on_transition_finished
	get_tree().change_scene_to_file("res://Scene/cut_scene_story.tscn")
	
func _on_hard_pressed():
	click.play()
	global.difficulty_hard()
	Transition.transition()
	await Transition.on_transition_finished
	get_tree().change_scene_to_file("res://Scene/cut_scene_story.tscn")
	
func _on_imposible_pressed():
	click.play()
	global.difficulty_imposible()
	Transition.transition()
	await Transition.on_transition_finished
	get_tree().change_scene_to_file("res://Scene/cut_scene_story.tscn")

func _on_ldm_pressed():
	global.ldm = true

func _on_setting_button_pressed():
	click.play()
	return_box.visible = true
	version.visible = false
	start.visible = false
	setting.visible = false
	graphic_setting.visible = true

func _on_background_pressed():
	if global.is_background == true:
		click.play()
		global.is_background = false
	else:
		click.play()
		global.is_background = true

func _on_props_pressed():
	if global.is_props == true:
		click.play()
		global.is_props = false
	else:
		click.play()
		global.is_props = true

func _on_version_pressed():
	click.play()
	return_box.visible = true
	update.visible = true
	start.visible = false
	version.visible = false
	setting.visible = false
	$Judul.visible = false
	$AnimatedSprite2D.visible = false
	$Update/Page2.visible = false
	$"Update/Previous Box".visible = false
	
	
func _on_return_button_pressed():
	click.play()
	graphic_setting.visible = false
	return_box.visible = false
	update.visible = false
	start.visible = true
	version.visible = true
	setting.visible = true
	$Judul.visible = true
	$AnimatedSprite2D.visible = true

func _on_touch_screen_button_pressed():
	if global.speedrun_mode == false:
		click.play()
		global.speedrun_mode = true
	else:
		click.play()
		global.speedrun_mode = false

func _on_next_pressed():
	click.play()
	$Update/Page1.visible = false
	$Update/Page2.visible = true
	$"Update/Next Box".visible = false
	$"Update/Previous Box".visible = true
	
func _on_previous_pressed():
	click.play()
	$Update/Page1.visible = true
	$Update/Page2.visible = false
	$"Update/Next Box".visible = true
	$"Update/Previous Box".visible = false

