extends Area2D

signal clicked
signal missed

# Limites del world boundaries (deberías pasar estos límites desde el mundo)
var world_rect = Rect2()  # Cambia este tamaño según tu juego
var visible_time = 2.0  # segundos que permanece el objetivo visible
var timer = 0.0


func _ready():
	randomize()
	var screen_size = get_viewport_rect().size
	var rect_size = Vector2(200, 110)  # Tamaño del área central donde aparecerá el enemigo
	var rect_pos = (screen_size - rect_size) / 2
	world_rect = Rect2(rect_pos, rect_size)
	respawn()

func _process(delta):
	timer += delta
	if timer > visible_time:
		emit_signal("missed")
		respawn()

func respawn():
	# Generar posición aleatoria dentro del área
	position = Vector2(
		randf_range(world_rect.position.x, world_rect.position.x + world_rect.size.x),
		randf_range(world_rect.position.y, world_rect.position.y + world_rect.size.y)
	)
	timer = 0.0
	show()  # Si ocultas el nodo entre repawns

func _input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		emit_signal("clicked")
		respawn()
