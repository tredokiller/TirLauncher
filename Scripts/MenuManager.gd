extends Node2D

onready var canvas_modulate = $Canvas/Modulate

onready var play_button = $Canvas/Play
onready var settings_button = $Canvas/Settings

func _ready():
	canvas_modulate.color = Color.black
	
	var tween = create_tween()
	
	tween.tween_property(canvas_modulate, "color", Color.white, 2)
	tween.play()
	
	play_button.connect("button_up", self, "play")
	settings_button.connect("button_up", self, "open_settings")


func play():
	get_tree().quit()


func open_settings():
	OS.shell_open(Settings.path_to_tracker)
