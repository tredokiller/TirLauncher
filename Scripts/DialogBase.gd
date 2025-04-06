extends Control

class_name DialogBase

export (float) var open_close_time = 0.1

onready var transition_tween
onready var is_showed : bool = false

func _ready():
	visible = false
	modulate.a = 0


func show():
	transition_tween = create_tween()
	
	is_showed = true
	visible = true
	
	# Animate alpha from 0 to 1 over 1 second
	transition_tween.tween_property(self, "modulate:a", 1.0, open_close_time)
	transition_tween.play()


func hide():
	transition_tween = create_tween()
	transition_tween.tween_property(self, "modulate:a", 0.0, open_close_time)
	transition_tween.play()
	
	is_showed = false
	yield(transition_tween, "finished")
	
	visible = false
