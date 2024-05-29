extends Control

@onready var canvas_layer = $CanvasLayer
@onready var total_waktu = $"CanvasLayer/Total Waktu"

func _ready():
	canvas_layer.visible = false
	
func thanks_for_playing_mulai():
	canvas_layer.visible = true
	$CanvasLayer/AnimationPlayer.play("Thanks")
	$Timer.start()
	
	if global.speedrun_mode == true:
		total_waktu.visible = true
		$"CanvasLayer/Total Waktu/Waktu".text = str(global.total_waktu)
		print(global.total_waktu)
	else:
		total_waktu.visible = false
	
func _on_timer_timeout():
	$Timer.stop()
	Transition.transition()
	await Transition.on_transition_finished
	get_tree().change_scene_to_file("res://Scene/main_menu.tscn")
