extends CharacterBody2D

@export var speed := 200.0
@onready var anim = $AnimatedSprite2D

func _ready():
	anim.play("fly")

func _physics_process(delta):
	var mouse_pos = get_viewport().get_mouse_position()
	var direction = (mouse_pos - global_position).normalized()
	velocity = direction * speed
	move_and_slide()

	anim.flip_h = direction.x < 0
