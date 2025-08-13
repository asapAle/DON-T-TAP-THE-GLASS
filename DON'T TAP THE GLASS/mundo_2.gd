extends Node2D

@export var SCENE_PATH: String = "res://mundo_2.tscn"  # Cambiá esto en cada escena

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
		# Guardar ruta actual antes de ir a Game Over
		get_tree().set_meta("ultima_escena", SCENE_PATH)
		get_tree().change_scene_to_file("res://game_over.tscn")

func update_life_sprites():
	for i in range(vidas.size()):
		vidas[i].visible = (i < lives)

	for stage in stages:
		stage.visible = false

	if lives > 0 and lives <= stages.size():
		stages[stages.size() - lives].visible = true
