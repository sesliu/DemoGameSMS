extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.



func  _on_body_entered(body):
	
	get_tree().get_root().get_node("World1").get_node("Player").get_node("Hurt").play(); 
	print(body)


