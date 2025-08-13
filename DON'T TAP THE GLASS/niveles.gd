extends Control


func _on_nivel_1_pressed() -> void:
	get_tree().change_scene_to_file("res://mundo.tscn")


func _on_nivel_2_pressed() -> void:
	get_tree().change_scene_to_file("res://mundo_2.tscn")


func _on_nivel_3_pressed() -> void:
	get_tree().change_scene_to_file("res://mundo_3.tscn")
