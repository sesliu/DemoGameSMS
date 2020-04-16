extends KinematicBody2D


var WALK_FORCE = 80
var WALK_MAX_SPEED = 80
const STOP_FORCE = 2000
const JUMP_SPEED = 90
var is_playing = true

var  WORLD = preload("res://Levels/World1/World1.gd");
var velocity = Vector2()
const TIME_PERIOD = 6.5 # 500ms
var time 
onready var jumping = get_node("Jump")
onready var hurting = get_node("Hurt")
onready var ataque = get_node("Ataque")
var dano 
var checkpointPositionPlayer = null
var checkpoint = false
var tempo 

onready var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

# Called when the node enters the scene tree for the first time.
func _ready():
	if(!get_tree().get_root().get_node("/root/Global").playMove):
		get_node("AnimatedSprite").play("falling")
		
		
		

func _process(delta):
	dano = get_tree().get_root().get_node("/root/Global").dano



func _physics_process(delta):
	var moved = false;
	var jump = false;
	var attack = false;
	
	
	
	
	# Horizontal movement code. First, get the player's input.
	var walk = WALK_FORCE * (Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left"))
	# Slow down the player if they're not trying to move.
	
	if get_tree().get_root().get_node("/root/Global").playMove and Input.is_action_pressed("ui_left"):
		get_node("AnimatedSprite").flip_h= true;
		moved = true
		jump = false
		attack = false
		
		
		
	
	if get_tree().get_root().get_node("/root/Global").playMove and Input.is_action_pressed("ui_right"):
		get_node("AnimatedSprite").flip_h= false;
		moved = true
		jump = false
		attack = false
		
	if get_tree().get_root().get_node("/root/Global").playMove and  !is_on_floor()  and Input.is_action_pressed("jump"):
		jump = true
		#get_node("AnimatedSprite").play("jumping")
	
	if(get_tree().get_root().get_node("/root/Global").playMove and  !is_on_floor()  and Input.is_action_pressed("ui_down")):
		attack = true
		get_node("pe/pe").disabled = false
	else:
		get_node("pe/pe").disabled = true
	
	if abs(walk) < WALK_FORCE * 0.2:
		# The velocity, slowed down a bit, and then reassigned.
		velocity.x = move_toward(velocity.x, 0, STOP_FORCE * delta)
	else:
		velocity.x += walk * delta
	# Clamp to the maximum horizontal movement speed.
	velocity.x = clamp(velocity.x, -WALK_MAX_SPEED, WALK_MAX_SPEED)

	# Vertical movement code. Apply gravity.
	velocity.y += gravity * delta

	# Move based on the velocity and snap to the ground.
	velocity = move_and_slide_with_snap(velocity, Vector2.DOWN, Vector2.UP)

	# Check for jumping. is_on_floor() must be called after movement code.
	if get_tree().get_root().get_node("/root/Global").playMove and  is_on_floor() and Input.is_action_just_pressed("jump"):
		jumping.play()
		velocity.y = -JUMP_SPEED
	
	if get_tree().get_root().get_node("/root/Global").playMove and  !is_on_floor() and Input.is_action_just_pressed("ui_down"):
		tempo = get_tree().create_timer(0.6)
		yield(tempo,"timeout")		
		ataque.play()
		velocity.y = JUMP_SPEED*3.5
	
	
	
	if( get_tree().get_root().get_node("/root/Global").playMove and moved and is_on_floor()):
		get_node("AnimatedSprite").play("running")
	elif( get_tree().get_root().get_node("/root/Global").playMove and is_on_floor() and !jump):
		get_node("AnimatedSprite").play("idle")
	elif(get_tree().get_root().get_node("/root/Global").playMove and !is_on_floor() and moved):
		get_node("AnimatedSprite").play("falling")	
		
	if( get_tree().get_root().get_node("/root/Global").playMove and attack and !is_on_floor()):
		get_node("AnimatedSprite").play("attack")
		
	elif( get_tree().get_root().get_node("/root/Global").playMove and jump and !is_on_floor()):
		get_node("AnimatedSprite").play("jumping")	
	elif( get_tree().get_root().get_node("/root/Global").playMove and !moved and !jump and !is_on_floor() and !attack):
		get_node("AnimatedSprite").play("falling")	
	
	
	if(dano):
		var tempo = get_tree().create_timer(0.5)
		var perdeVida  = get_tree().get_root().get_node("/root/Global").vidas
		perdeVida = perdeVida -1
		if(is_playing):
				hurting.play()
				is_playing = false
		
		if(perdeVida > 0 and checkpointPositionPlayer!= null):
			get_node("AnimatedSprite").play("hurting")	
			yield(tempo,"timeout")		
			get_tree().get_root().get_node("/root/Global").dano = false
			get_tree().get_root().get_node("/root/Global").vidas = perdeVida
		
			get_node(".").position = checkpointPositionPlayer
			get_node("AnimatedSprite").flip_h = false	
			
		
		else:
			get_tree().get_root().get_node("/root/Global").gameOver = true 
		
	dano = false	
		
	if(get_tree().get_root().get_node("/root/Global").checkpoint):
		checkpointPositionPlayer = get_node(".").position
		get_tree().get_root().get_node("/root/Global").checkpoint = false
		is_playing = true
		print(checkpointPositionPlayer)
	
	
		

			

