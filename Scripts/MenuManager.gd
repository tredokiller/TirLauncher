extends Node2D

onready var canvas_modulate = $Canvas/Parent/Modulate

onready var play_button = $Canvas/Parent/Play
onready var settings_button = $Canvas/Parent/Settings
onready var tip_button = $Canvas/Parent/Tip

onready var tip_ui = $Canvas/Parent/TipUI

onready var parent = $Canvas/Parent


func _ready():
	canvas_modulate.color = Color.black
	animate_start()
	
	var tween = create_tween()
	
	tween.tween_property(canvas_modulate, "color", Color.white, 2)
	tween.play()
	
	play_button.connect("button_clicked", self, "play")
	settings_button.connect("button_clicked", self, "open_settings")
	tip_button.connect("button_clicked", self, "open_tips")


func play():
	open_settings()
	open_game()
	get_tree().quit()

func animate_start():
	var tween = create_tween()
	var duration = 0.5  # seconds
	var start_size = Vector2(1, 1) 
	OS.window_size = start_size
	var end_size = Vector2(960, 575)  # avoid (0, 0) because some OSes freak out
	tween.tween_property(OS, "window_size", end_size, duration).set_trans(Tween.TRANS_CUBIC).set_ease(Tween.EASE_IN_OUT)
	yield(tween, "finished")
	
	


func open_settings():
	OS.shell_open(Settings.path_to_tracker)

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
