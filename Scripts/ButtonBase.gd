extends TextureButton

class_name ButtonBase

func _ready():
	connect("mouse_entered", self, "up_scale")
	connect("mouse_exited", self, "normal_scale")
	connect("button_down", self, "down_scale")
	connect("button_up", self, "normal_scale")

func up_scale():
	var tween = create_tween()
	
	tween.tween_property(self, "rect_scale", Vector2.ONE * 1.15, 0.2)
	tween.play()

func normal_scale():
	var tween = create_tween()
	
	tween.tween_property(self, "rect_scale", Vector2.ONE, 0.2)
	tween.play()

func down_scale():
	var tween = create_tween()
	
	tween.tween_property(self, "rect_scale", Vector2.ONE * 0.9, 0.2)
	tween.play()
