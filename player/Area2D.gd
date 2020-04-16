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


func _on_Area2D_area_entered(area):
	
		print(area.name)
		if(area.name == "frog" or area.name == "frog2"):
			get_tree().get_root().get_node("/root/Global").enemyDano = true
			get_tree().get_root().get_node("/root/Global").inimigo = area.name 
		
		if(area.name == "danoBoss"):
			get_tree().get_root().get_node("/root/Global").bossDano = true
			
