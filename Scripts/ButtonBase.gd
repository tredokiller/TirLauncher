extends TextureButton

class_name ButtonBase

<<<<<<< HEAD
signal button_clicked()

var is_mouse_inside = false

func _ready():
	connect("mouse_entered", self, "on_mouse_entered")
	connect("mouse_exited", self, "on_mouse_exited")
	connect("button_down", self, "down_scale")
	connect("button_up", self, "on_button_up")

func on_mouse_entered():
	up_scale()

func on_mouse_exited():
	normal_scale()

func on_button_up():
	normal_scale()
	if is_mouse_inside():
		emit_signal("button_clicked")
=======
func _ready():
	connect("mouse_entered", self, "up_scale")
	connect("mouse_exited", self, "normal_scale")
	connect("button_down", self, "down_scale")
	connect("button_up", self, "normal_scale")
>>>>>>> ff7c989eac043df13e2c701f175e5229ae0bcddb

func up_scale():
	var tween = create_tween()
	
<<<<<<< HEAD
	tween.tween_property(self, "rect_scale", Vector2.ONE * 1.15, 0.1)
=======
	tween.tween_property(self, "rect_scale", Vector2.ONE * 1.15, 0.2)
>>>>>>> ff7c989eac043df13e2c701f175e5229ae0bcddb
	tween.play()

func normal_scale():
	var tween = create_tween()
	
<<<<<<< HEAD
	tween.tween_property(self, "rect_scale", Vector2.ONE, 0.1)
=======
	tween.tween_property(self, "rect_scale", Vector2.ONE, 0.2)
>>>>>>> ff7c989eac043df13e2c701f175e5229ae0bcddb
	tween.play()

func down_scale():
	var tween = create_tween()
	
<<<<<<< HEAD
	tween.tween_property(self, "rect_scale", Vector2.ONE * 0.9, 0.1)
	tween.play()

func is_mouse_inside():
	if not Rect2(get_global_rect()).has_point(get_global_mouse_position()):
		return false
	return true
=======
	tween.tween_property(self, "rect_scale", Vector2.ONE * 0.9, 0.2)
	tween.play()
>>>>>>> ff7c989eac043df13e2c701f175e5229ae0bcddb
