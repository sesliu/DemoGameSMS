extends Area2D


const PLAYER = preload("res://player/Player.gd")

		

	


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Area2D_body_entered(body):
	
	if(body.name == "Player"):
	
		if(get_tree().get_root().get_node("/root/Global").proxFase):
			
			print("passou")
			get_tree().get_root().get_node("/root/Global").gameOver = true 
		else:
			get_tree().get_root().get_node("/root/Global").dano = true
		
		
		
	
		
		
		
		
	
	
			
		
