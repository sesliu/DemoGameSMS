extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_obstaculo1_area_entered(area):
	if(get_tree().get_root().get_node("World1").get_node("Inimigo/frog")!= null and !get_tree().get_root().get_node("/root/Global").enemyDano) :
		if(area.name == "frog"):
				get_tree().get_root().get_node("World1").get_node("Inimigo/frog").get_node("AnimatedSprite").flip_h = true	
				get_tree().get_root().get_node("World1").get_node("Inimigo/frog").get_node("AnimatedSprite").play("idle")
				yield(get_tree().create_timer(0.5),"timeout")
				if(get_tree().get_root().get_node("World1").get_node("Inimigo/frog")!= null and !get_tree().get_root().get_node("/root/Global").enemyDano):
					get_tree().get_root().get_node("World1").get_node("Inimigo/frog").get_node("AnimatedSprite").play("up")
				
