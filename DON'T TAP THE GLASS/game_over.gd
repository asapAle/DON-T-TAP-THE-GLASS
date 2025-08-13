extends Control

@onready var label_score = $VBoxContainer/LabelScore # Ajustá según tu escena

func _ready():
	# Mostrar puntaje de la partida
	var s = 0
	if get_tree().has_meta("ultimo_score"):
		s = int(get_tree().get_meta("ultimo_score"))
	label_score.text = "Puntaje: " + str(s)

func _on_reintentar_pressed() -> void:
	if get_tree().has_meta("ultima_escena"):
		get_tree().change_scene_to_file(get_tree().get_meta("ultima_escena"))
	else:
		get_tree().change_scene_to_file("res://mundo.tscn")

func _on_inicio_pressed() -> void:
	get_tree().change_scene_to_file("res://menu.tscn")
