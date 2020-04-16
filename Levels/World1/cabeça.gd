extends Area2D

var dano


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _process(delta):
	dano = get_tree().get_root().get_node("/root/Global").bossDano

func _physics_process(delta):
	
	if(dano):
		
		var perdeVida  = get_tree().get_root().get_node("/root/Global").bossVida
		perdeVida = perdeVida -1
		#yield(tempo,"timeout")		
		get_tree().get_root().get_node("World1").get_node("Boss/boss/AnimatedSprite").play("damage")
		#if(is_playing):
		#		hurting.play()
		#		is_playing = false
		
		if(perdeVida > 0):
			#get_node("AnimatedSprite").play("hurting")	
			#yield(tempo,"timeout")		
			#get_tree().get_root().get_node("/root/Global").bossDano = false
			get_tree().get_root().get_node("/root/Global").bossVida = perdeVida
		
		else:
			get_tree().get_root().get_node("World1").get_node("Boss/boss/AnimatedSprite").play("fly")
			get_tree().get_root().get_node("World1").get_node("Boss/boss/AnimationPlayer").play("indo embora")
			yield( get_tree().create_timer(6.0),"timeout")	
			get_tree().get_root().get_node("/root/Global").fimFase = true
			get_tree().get_root().get_node("World1").get_node("Boss/boss/AnimationPlayer").stop()
			
			print("Chefe morreu")
		
		dano = false
		get_tree().get_root().get_node("/root/Global").bossDano = false	
	else: 
		get_tree().get_root().get_node("World1").get_node("Boss/boss/AnimatedSprite").play("fly")
