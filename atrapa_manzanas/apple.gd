extends Area2D

@onready var anim = $AnimatedSprite2D
@onready var sound = $AudioStreamPlayer
@onready var screen_size = get_viewport_rect().size  # Detecta el tamaño de pantalla al iniciar

func _ready():
	anim.play("normal")
	move_to_random_position()  # Asegura que aparezca al inicio en una buena posición

func _on_Apple_body_entered(body):
	if body.name == "Parrot":
		bite_and_teleport()

func bite_and_teleport():
	anim.play("bite")
	sound.play()
	get_parent().increase_score()  # Llama a Main para subir el puntaje
	await get_tree().create_timer(0.5).timeout
	anim.play("normal")
	move_to_random_position()

func move_to_random_position():
	var margin = 60  # margen para que no quede en las orillas ni fuera de la vista
	var rand_x = randf_range(margin, screen_size.x - margin)
	var rand_y = randf_range(margin, screen_size.y - margin)
	global_position = Vector2(rand_x, rand_y)
	print("🍏 Nueva posición de la manzana:", global_position)
