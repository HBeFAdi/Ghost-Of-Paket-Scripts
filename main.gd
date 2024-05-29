extends Node

@onready var layer_2 = $ParallaxBackground/Layer2
@onready var layer_3 = $ParallaxBackground/Layer3
@onready var props = $Props

func _ready():
	if global.is_background == false:
		layer_2.visible = false
		layer_3.visible = false
		
	if global.is_background == true:
		layer_2.visible = true
		layer_3.visible = true
	
	if global.is_props == false:
		props.visible = false
	
	if global.is_props == true:
		props.visible = true
