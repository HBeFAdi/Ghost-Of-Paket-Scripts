extends CharacterBody2D

const SPEED = 300.0
const JUMP_VELOCITY = -550
@onready var sprite_2d = $Sprite2D
@onready var attack_cooldown = $"Attack Cooldown"
@onready var deal_attack_timer = $"Deal Attack Timer"
@onready var ui_health___kill = $"../UI/UI Health & Kill"
@onready var ui_game_over = $"../UI/UI Game Over"
@onready var ui_button = $"../UI/UI Button"
@onready var attack_sfx = $"Attack SFX"
@onready var jump_sfx = $"Jump SFX"
@onready var death_sfx = $"Death SFX"
@onready var player_attack_cooldown = $"Player Attack Cooldown"
@onready var heal_sfx = $"Heal SFX"

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var current_state = "idle"
var current_dir = "none"

var enemy_in_attack_range = false
var enemy_cooldown = true
var player_cooldown = true
var health = 100
var player_is_alive = true

var attack_ip = false
var death_sound = 1

func _physics_process(delta):
	enemy_attack()
	attack()
	
	if health <= 0:
		if death_sound == 1:
			death_sfx.play()
			death_sound = death_sound - 1
		ui_button.when_player_dead_1()
		ui_game_over.when_player_dead()
		dead_animation()
		player_is_alive = false
		health = 0
		global.apakah_masih_speedrun = false
		global.total_waktu = 0
		$"../UI/UI Health & Kill".waktu = 0
		
	if not is_on_floor():
		velocity.y += gravity * delta

	if Input.is_action_just_pressed("jump") and is_on_floor():
		jump_sfx.play()
		velocity.y = JUMP_VELOCITY
		current_state = "jumping"
		
	if is_on_floor() and global.is_still_jump == true:
		jump_sfx.play()
		velocity.y = JUMP_VELOCITY
		current_state = "jumping"
		
	var direction = Input.get_axis("left", "right")
	if direction != 0:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()

	if Input.is_action_just_pressed("attack"):
		current_state = "attack"
		sprite_2d.play("attack")

	if player_is_alive == true:
		if current_state != "attack":
			if is_on_floor():
				if direction != 0:
					sprite_2d.play("running")
					current_state = "running"
				else:
					sprite_2d.play("idle")
					current_state = "idle"
			else:
				sprite_2d.play("jumping")
				current_state = "jumping"
	
	if Input.is_action_just_pressed("left"):
		sprite_2d.flip_h = true
	if Input.is_action_just_pressed("right"):
		sprite_2d.flip_h = false

func _on_sprite_2d_animation_finished():
	if player_is_alive == true:
		if sprite_2d.animation == "attack":
			if is_on_floor():
				if Input.get_axis("left", "right") != 0:
					sprite_2d.play("running")
					current_state = "running"
				else:
					sprite_2d.play("idle")
					current_state = "idle"
			else:
				sprite_2d.play("jumping")
				current_state = "jumping"
	
func _on_player_hitbox_body_entered(body):
	if body.has_method("enemy"):
		enemy_in_attack_range = true
		
func _on_player_hitbox_body_exited(body):
	if body.has_method("enemy"):
		enemy_in_attack_range = false

func enemy_attack():
	if enemy_in_attack_range and enemy_cooldown == true and player_is_alive == true and global.enemy_dead == false:
		attack_sfx.play()
		ui_health___kill.minus_health()
		health = health - global.damage_to_player
		enemy_cooldown = false
		attack_cooldown.start()

func _on_attack_cooldown_timeout():
	enemy_cooldown = true
	
func attack():
	if Input.is_action_just_pressed("attack"):
		if player_cooldown == true:
			attack_sfx.play()
			player_cooldown = false
			player_attack_cooldown.start()
			global.player_current_attack = true
			attack_ip = true
			deal_attack_timer.start()

func _on_deal_attack_timer_timeout():
	deal_attack_timer.stop()
	global.player_current_attack = false
	attack_ip = false

func _on_player_attack_cooldown_timeout():
	player_cooldown = true

func dead_animation():
	sprite_2d.animation = "dead"

func get_heal_potion_1():
	heal_sfx.play()
	health = health + global.heal_point
	if health >= 100:
		health = 100

func player_falling_below_ground():
	health = 0
