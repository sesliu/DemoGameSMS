extends Node2D



var spawn_point = Vector2(300, 200)
var times = 254
var bossVida = 8
onready var music = get_node("World/MusicaFundo")
onready var boss = get_node("Boss/Boss")
onready var bossFase = get_node("Boss/BossFase")
onready var checkpoint = get_node("Checkpoint/checkpoint")
onready var sapo1 = get_node("Inimigo/frog")
var is_playing = true
var is_playingBoss = true
var is_playingBossFase = true
var fimFase = true


# Called when the node enters the scene tree for the first time.
func _ready():
	#Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	get_tree().get_root().get_node("/root/Global").dano = false
	get_tree().get_root().get_node("/root/Global").boss = false
	get_node("Boss/bossWall").visible = false
	get_node("Boss/bossWall").collision_layer = 0
	get_node("Boss/bossWall").collision_mask = 0
	get_node("Boss/boss").visible = false
	get_node("Boss/boss/AnimationPlayer").stop()
	get_tree().get_root().get_node("/root/Global").totalItem = 0
	boss.stop()
	bossFase.stop()
	get_tree().get_root().get_node("/root/Global").bossVida = bossVida
	
	
	

	
	
	
	
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	times = (times - delta)
	
	get_tree().get_root().get_node("/root/Global").time = str(int(times)); 
	
		
	if(!get_tree().get_root().get_node("/root/Global").boss):
		if(is_playing):
			music.play()
			is_playing = false
	
	if(int(times) == 30):
		music.set_pitch_scale(1.5)
		
	
	if(int(times) == 0):
		get_tree().get_root().get_node("/root/Global").dano = true
		times = 254
		music.set_pitch_scale(1.0)
		pass
	
	if(get_tree().get_root().get_node("/root/Global").boss):
		music.stop()
		if(is_playingBoss):
			boss.play()
			is_playingBoss = false
		get_node("Plataforma/Plataforma3").hide()
	
	
	if(get_tree().get_root().get_node("/root/Global").bossFase):
		music.stop()
		boss.stop()
		if(is_playingBossFase):
			bossFase.play()
			get_node("Boss/bossWall").collision_layer = 1
			get_node("Boss/bossWall").collision_mask = 1
			is_playingBossFase = false
			get_node("Boss/boss").visible = true
			get_node("Boss/boss/AnimationPlayer").play("movendo")
	
		
	if(get_tree().get_root().get_node("/root/Global").checkpoint):
		if(is_playingBoss):
			checkpoint.play()
			is_playingBoss = false
	
	
		
		
		
		
func _physics_process(delta):
		if(get_tree().get_root().get_node("/root/Global").fimFase):
			is_playing = true
			get_node("Player").WALK_MAX_SPEED = 0
			var tempo = get_tree().create_timer(4.5)
			var tempo2 = get_tree().create_timer(1.0)
			get_node("Player/AnimatedSprite").flip_h= false
			if(get_node("Player/AnimatedSprite").is_playing()):
				get_node("Player/AnimatedSprite").play("running")
				
				
			if(fimFase):
				
				get_tree().get_root().get_node("/root/Global").playMove = false 
				get_tree().get_root().get_node("/root/Global").proxFase = true
				fimFase = false
				get_node("Player").get_node("AnimationPlayer").play("movendo")
				
				yield(tempo,"timeout")		
				get_node("Player").get_node("AnimationPlayer").stop()
				#get_node("Player/AnimatedSprite").play("idle")
				#yield(tempo2,"timeout")	
				get_node("Player/AnimatedSprite").play("falling")
				get_node("Player").get_node("AnimationPlayer").play("pulando")
				get_tree().get_root().get_node("World1").get_node("boss").free()
	
		get_tree().get_root().get_node("/root/Global").fimFase = false
					
func _on_checkpoint_body_entered(body):
	pass # Replace with function body.
