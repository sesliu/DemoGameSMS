extends Area2D


const SPEED = 100.0  
var matou = true
var esconde = true
var dano

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _physics_process(delta):

	if(get_tree().get_root().get_node("/root/Global").enemyDano):
		
		
		if(get_tree().get_root().get_node("/root/Global").inimigo == "frog"):
			print("matou o sapo 1")
			if(matou):
				get_node("CollisionShape2D").disabled =  true
				get_node("AnimationPlayer").stop()
				get_node("AnimatedSprite").play("death")
				yield(get_tree().create_timer(0.5),"timeout")
			
				matou = false
				get_node(".").hide()
				get_tree().get_root().get_node("/root/Global").enemyDano = false
	
		
			
func _on_frog_body_entered(body):
	
		if(body.name == "Player"):
			get_tree().get_root().get_node("/root/Global").dano = true
		


func _on_AnimatedSprite_animation_finished():
	pass
