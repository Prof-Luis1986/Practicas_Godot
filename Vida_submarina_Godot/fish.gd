extends CharacterBody2D

@export var speed := 200.0
@onready var sprite := $SpriteAnimado

func _ready():
	sprite.play("parpadeo")  # Asegúrate de que la animación esté bien escrita

func _physics_process(delta):
	var direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	velocity = direction * speed
	move_and_slide()
