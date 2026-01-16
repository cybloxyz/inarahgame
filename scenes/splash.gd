extends Control

@export_file("*.tscn") var main_game_scene: String

func _gui_input(event):
	# Fungsi ini khusus menangkap input pada area node Control ini
	if event is InputEventMouseButton or event is InputEventScreenTouch:
		if event.pressed:
			# Ganti ke scene game kamu
			get_tree().change_scene_to_file("res://scenes/utama.tscn")
