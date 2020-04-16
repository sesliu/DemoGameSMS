extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_gem_body_entered(body):
	if(body.name == "Player"):
		var item = get_tree().get_root().get_node("/root/Global").totalItem
		item = item + 1
		get_tree().get_root().get_node("/root/Global").totalItem = item
		get_node("gemAni").play("coletarItem")
		yield( get_tree().create_timer(1.5),"timeout")	
		#queue_free()


func _on_AnimationPlayer_animation_finished(anim_name):
	pass # Replace with function body.
