extends Area2D

@export var speed: float = 100.0
@export var limite_inferior: float = 600.0
@onready var sound = $AudioStreamPlayer

func _ready():
	randomize()
	reset_position()
	connect("body_entered", Callable(self, "_on_body_entered"))

func _process(delta: float) -> void:
	position.y += speed * delta
	if position.y > limite_inferior:
		reset_position()

func reset_position():
	position = Vector2(randf_range(0, 760), randf_range(-100, -40))

func _on_body_entered(body):
	if body.name == "Fish":
		get_parent().restar_vida()  # 👈 llama al método del main para restar vida
		sound.play()
		reset_position()
