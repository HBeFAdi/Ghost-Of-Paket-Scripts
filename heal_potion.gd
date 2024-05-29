extends Area2D

@onready var main_character = $"../../Main Character"
@onready var ui_health___kill = $"../../UI/UI Health & Kill"

func _on_body_entered(body):
	if body.name == "Main Character":
		ui_health___kill.get_heal_potion()
		main_character.get_heal_potion_1()
		self.queue_free()
		print("yes")
