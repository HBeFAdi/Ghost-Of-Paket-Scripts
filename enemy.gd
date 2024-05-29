extends CharacterBody2D

var gravity = 10
var speed = 100
var player_chase_left = false
var player_chase_right = false
var player = null

var health = 100
var player_in_attack_zone = false
var can_take_damage = true
var is_enemy_died = false

@onready var animated_sprite_2d = $AnimatedSprite2D
@onready var take_damage_cooldown = $"Take Damage Cooldown"
@onready var dead_time = $"Dead Time"
@onready var ui_health___kill = $"../../UI/UI Health & Kill"

func _ready():
	animated_sprite_2d.play("idle")

func enemy():
	pass
	
func _process(delta):
	deal_with_damage()
	velocity.y += gravity
	move_and_slide()
	
	if is_enemy_died == false:
		$CollisionShape2D2.disabled = true
		if player_chase_left == false || player_chase_right == false:
			velocity.x = 0
		
		if player_chase_left == true:
			velocity.x = -speed
			animated_sprite_2d.flip_h = true
		
		if player_chase_right == true:
			velocity.x = speed
			animated_sprite_2d.flip_h = false
		
	if is_enemy_died == true:
		velocity.x = 0
		
func _on_detection_area_left_body_entered(body):
	if is_enemy_died == false:
		player = body
		player_chase_left = true
		animated_sprite_2d.play("running")
		
func _on_detection_area_left_body_exited(body):
	if is_enemy_died == false:
		player = body
		player_chase_left = false
		animated_sprite_2d.play("idle")
	
func _on_detection_area_right_body_entered(body):
	if is_enemy_died == false:
		player = body
		player_chase_right = true
		animated_sprite_2d.play("running")

func _on_detection_area_right_body_exited(body):
	if is_enemy_died == false:
		player = body
		player_chase_right = false
		animated_sprite_2d.play("idle")

func _on_enemy_hitbox_body_entered(body):
	if is_enemy_died == false and body.name == "Main Character":
		global.enemy_dead = false
		player_in_attack_zone = true
		animated_sprite_2d.play("attack")
		
func _on_enemy_hitbox_body_exited(body):
	if is_enemy_died == false and body.name == "Main Character":
		player_in_attack_zone = false

func deal_with_damage():
	if player_in_attack_zone == true and global.player_current_attack == true and can_take_damage == true:
		health = health - global.damage_to_enemy
		can_take_damage = false
		take_damage_cooldown.start()
		if health <= 0:
			health = 0
			ui_health___kill.add_kill()
			is_enemy_died = true
			global.enemy_dead = true
			$CollisionShape2D2.disabled = false
			$CollisionShape2D.disabled = true
			dead_animation()

func _on_take_damage_cooldown_timeout():
	if is_enemy_died == false:
		can_take_damage = true
		
func dead_animation():
	animated_sprite_2d.play("dead")
	dead_time.start()
	
func _on_dead_time_timeout():
	global.enemy_dead = false
	self.queue_free()
