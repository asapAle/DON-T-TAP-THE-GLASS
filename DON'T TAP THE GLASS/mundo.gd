extends Node2D

@export var SCENE_PATH: String = "res://mundo.tscn"  # Cambiá en cada mundo

@onready var enemy = $Enemy
@onready var vidas = [
	$CanvasLayer/Vida1,
	$CanvasLayer/Vida2,
	$CanvasLayer/Vida3
]
@onready var stages = [
	$CanvasLayer/Stage1, # Para 3 vidas
	$CanvasLayer/Stage2, # Para 2 vidas
	$CanvasLayer/Stage3  # Para 1 vida
]

var lives := 3
var score := 0

func _ready():
	enemy.connect("clicked", Callable(self, "_on_enemy_clicked"))
	enemy.connect("missed", Callable(self, "_on_enemy_missed"))
	update_life_sprites()

func _on_enemy_clicked():
	score += 1
	print("Puntaje: ", score)

func _on_enemy_missed():
	lives -= 1
	update_life_sprites()
	print("Vidas restantes: ", lives)
	if lives <= 0:
		# Guardar la escena actual y el puntaje antes de ir a Game Over
		get_tree().set_meta("ultima_escena", SCENE_PATH)
		get_tree().set_meta("ultimo_score", score)
		get_tree().change_scene_to_file("res://game_over.tscn")

func update_life_sprites():
	# Mostrar u ocultar vidas
	for i in range(vidas.size()):
		vidas[i].visible = (i < lives)

	# Ocultar todos los stages
	for stage in stages:
		stage.visible = false

	# Mostrar el stage correspondiente
	if lives > 0 and lives <= stages.size():
		stages[stages.size() - lives].visible = true
