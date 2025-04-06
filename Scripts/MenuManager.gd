extends Node2D

onready var canvas_modulate = $Canvas/Modulate

onready var play_button = $Canvas/Play
onready var settings_button = $Canvas/Settings
<<<<<<< HEAD
onready var tip_button = $Canvas/Tip

onready var tip_ui = $Canvas/TipUI
=======
>>>>>>> ff7c989eac043df13e2c701f175e5229ae0bcddb

func _ready():
	canvas_modulate.color = Color.black
	
	var tween = create_tween()
	
	tween.tween_property(canvas_modulate, "color", Color.white, 2)
	tween.play()
	
<<<<<<< HEAD
	play_button.connect("button_clicked", self, "play")
	settings_button.connect("button_clicked", self, "open_settings")
	tip_button.connect("button_clicked", self, "open_tips")


func play():
	open_settings()
	open_game()
=======
	play_button.connect("button_up", self, "play")
	settings_button.connect("button_up", self, "open_settings")


func play():
>>>>>>> ff7c989eac043df13e2c701f175e5229ae0bcddb
	get_tree().quit()


func open_settings():
	OS.shell_open(Settings.path_to_tracker)
<<<<<<< HEAD

func open_game():
	OS.shell_open(Settings.path_to_game)

func open_tips():
	tip_ui.show()

func _input(event):
	if event is InputEventKey or event is InputEventMouseButton:
		if tip_ui.is_showed:
			tip_ui.hide()

func show_tips():
	var tween = create_tween()
	
	tween.tween_property(canvas_modulate, "color", Color.white, 2)
	tween.play()
=======
>>>>>>> ff7c989eac043df13e2c701f175e5229ae0bcddb
