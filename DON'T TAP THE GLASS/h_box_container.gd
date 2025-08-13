extends HBoxContainer
@onready var puntajePlayer = $Puntaje
 
func _process(delta: float) -> void:
	puntajePlayer.text = str($score.pun)
