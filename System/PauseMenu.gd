extends PopupMenu

var pausado
var selecionado
onready var select = get_node("select")
onready var enter = get_node("enter")



# Called when the node enters the scene tree for the first time.
func _ready():
	#player = get_tree().get_root().get_node("/root/Player")
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func change_menu_color():
	
	get_node("Resume").color = Color.gray
	get_node("RestartGame").color = Color.gray
	get_node("Quit").color = Color.gray
	
	match selecionado:
		0:
			get_node("Resume").color = Color.greenyellow
		1:
			get_node("RestartGame").color = Color.greenyellow
		2:
			get_node("Quit").color =  Color.greenyellow

func _input(event):
	if not visible:
		if Input.is_action_just_pressed("pause"):
			
			# Pause game
			
			get_tree().paused = true
			#player.set_process_input(false)
			# Reset the popup
			selecionado = 0
			change_menu_color()
			# Show popup
			rect_position = Vector2(350,200)
			popup()
	else:
		if Input.is_action_just_pressed("ui_down"):
			selecionado = (selecionado + 1) % 3;
			change_menu_color()
			select.play()
		elif Input.is_action_just_pressed("ui_up"):
			selecionado = 2
			change_menu_color()
			select.play()
		
		elif Input.is_action_just_pressed("enter"):
			
			match selecionado:
				0:
					# Resume game
					enter.play()
					yield(get_tree().create_timer(0.5),"timeout")
					if not pausado:
						get_tree().paused = false
					hide()
				1:
					# Restart game
					enter.play()
					yield(get_tree().create_timer(0.5),"timeout")
					get_tree().reload_current_scene()
					get_tree().paused = false
					hide()
				2:
					# Quit game
					enter.play()
					yield(get_tree().create_timer(0.5),"timeout")
					get_tree().quit()
