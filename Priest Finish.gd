extends Area2D

@onready var finish_cut_scene = $"../Finish Cut Scene"
@onready var ui_health___kill = $"../UI/UI Health & Kill"
@onready var ui_button = $"../UI/UI Button"

func _on_body_entered(body):
	if body.name == "Main Character":
		global.apakah_masih_speedrun = false
		ui_button.hilang()
		ui_health___kill.hilang()
		Transition.transition()
		await Transition.on_transition_finished
		finish_cut_scene.finish_cut_scene_mulai()
