extends Node2D

var puntaje := 0
var vidas := 10

func _ready():
	$CanvasLayer/LabelPuntaje.text = "Puntaje: 0"
	$CanvasLayer/LabelVidas.text = "Vidas: 10"
	$GameOverScreen.visible = false  # Oculta la pantalla Game Over al iniciar
	$AudioFondo.play()  # Reproduce el audio de fondo

func sumar_punto():
	puntaje += 1
	$CanvasLayer/LabelPuntaje.text = "Puntaje: " + str(puntaje)

func restar_vida():
	vidas -= 1
	if vidas < 0:
		vidas = 0
	$CanvasLayer/LabelVidas.text = "Vidas: " + str(vidas)

	if vidas <= 0:
		mostrar_game_over()

func mostrar_game_over():
	get_tree().paused = true
	$GameOverScreen.visible = true  # Muestra la pantalla Game Over
