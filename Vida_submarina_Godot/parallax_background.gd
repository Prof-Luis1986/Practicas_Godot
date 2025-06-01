extends ParallaxBackground

# Variable para el pez
var fish

# Velocidad de movimiento del fondo
var parallax_speed = 0.5

func _ready():
	# Asignar el pez (suponiendo que el pez está en el nodo principal)
	fish = get_node("/root/Scene/Fish")  # Cambia el path si el pez está en otro lugar

func _process(delta):
	if fish:
		# Mueve el fondo basándonos en la posición del pez
		offset = Vector2(fish.position.x * parallax_speed, 0)
