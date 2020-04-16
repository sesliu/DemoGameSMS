extends Node

var current_scene = null
var vidas = 5
var time = 100
var dano = false
var cenaAtual = false;
var gameOver = false;
var pause = false;
var boss = false
var enemyDano = false
var checkpoint = null
var inimigo
var bossFase = false
var bossDano = false
var bossVida = 0
var fimFase = false
var playMove = true
var proxFase = false
var totalItem = 0

func _ready():
	pass

func _process(delta):
	if(cenaAtual):
		cenaAtual = false
		dano = false
		get_tree().reload_current_scene()	
		
	if(gameOver):
		var tempo = get_tree().create_timer(5.0)
		gameOver = false
		print("Game Over")
		
		get_tree().change_scene("res://Levels/GameOver/GameOver.tscn")
		yield(tempo,"timeout")
		vidas = 5
		dano = false
		get_tree().change_scene("res://Levels/World1/World1.tscn")
		

			
