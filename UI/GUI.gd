extends MarginContainer



# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var vidasValidas  = get_tree().get_root().get_node("/root/Global").vidas
	var time  = get_tree().get_root().get_node("/root/Global").time
	var item = get_tree().get_root().get_node("/root/Global").totalItem
	
	get_node("GridContainer/Life/vida").text = str(vidasValidas)
	get_node("GridContainer/Life/seconds").text = str(time)
	get_node("Item/gemItem").text = str(item)

