extends Area2D

@onready var main_character = $"../Main Character"

func _on_body_entered(body):
	if body.name == "Main Character":
		main_character.player_falling_below_ground()
