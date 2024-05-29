extends Panel

func _process(delta):
	if global.is_background == true:
		$Label.text = "Background On"
	if global.is_background == false:
		$Label.text = "Background Off"
	if global.is_props == true:
		$Label2.text  = "Props On"
	if global.is_props == false:
		$Label2.text = "Props Off"
	if global.speedrun_mode == true:
		$"../Chose Difficulty/Panel/Label".text = "Speedrun Mode : On"
	if global.speedrun_mode == false:
		$"../Chose Difficulty/Panel/Label".text = "Speeddrun Mode : Off"
