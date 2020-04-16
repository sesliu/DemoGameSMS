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



func _on_obstaculo5_area_entered(area):
	if(area.name == "frog2"):
		
			get_tree().get_root().get_node("World1").get_node("Inimigo/frog2").get_node("AnimatedSprite").play("down")
