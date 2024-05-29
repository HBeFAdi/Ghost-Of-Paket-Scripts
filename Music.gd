extends Node
@onready var respawn_sfx = $"Respawn SFX"
@onready var backsound = $Backsound

func _ready():
	respawn_sfx.play()
	backsound.play()
