extends Control

onready var exit_button = $"Exit Button"
onready var hide_button = $"Hide Button"

var following : bool = false
var drag_start_pos : Vector2 = Vector2.ZERO
var saved_window_position : Vector2

var should_slide_down_on_focus = false


func _ready():
	self.connect("gui_input", self, "on_gui_input")
	
	exit_button.connect("button_up", self, "exit")
	hide_button.connect("button_up", self, "hide")

func exit():
	animate_exit_and_quit()


func animate_exit_and_quit():
	var tween = create_tween()
	var duration = 0.5  # seconds
	var start_size = OS.get_window_size()
	var end_size = Vector2(1, 1)  # avoid (0, 0) because some OSes freak out
	tween.tween_property(OS, "window_size", end_size, duration).set_trans(Tween.TRANS_CUBIC).set_ease(Tween.EASE_IN_OUT)
	yield(tween, "finished")
	
	get_tree().quit()

func animate_hide_up():
	var tween = create_tween()
	var duration = 0.2
	var current_pos = OS.get_window_position()
	var window_size = OS.get_window_size()
	
	saved_window_position = current_pos
	var target_pos = current_pos - Vector2(0, window_size.y + 100)  # +100 for extra margin
	tween.tween_property(OS, "window_position", target_pos, duration).set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_IN)
	
	yield(tween, "finished")
	
	should_slide_down_on_focus = true
	OS.set_window_minimized(true)


func animate_show_down():
	var window_size = OS.get_window_size()
	var start_pos = saved_window_position - Vector2(0, window_size.y + 100)
	OS.set_window_position(start_pos)
	var tween = create_tween()
	
	tween.tween_property(OS, "window_position", saved_window_position, 0.2) \
		.set_trans(Tween.TRANS_QUAD) \
		.set_ease(Tween.EASE_OUT)

	yield(tween, "finished")

func hide():
	animate_hide_up()

func on_gui_input(event):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT:
			following = !following
			drag_start_pos = get_local_mouse_position()

func _process(delta):
	if following:
		OS.set_window_position(OS.window_position + get_global_mouse_position() - drag_start_pos)


func _notification(what):
	if what == MainLoop.NOTIFICATION_WM_FOCUS_IN and should_slide_down_on_focus:
		animate_show_down()
		should_slide_down_on_focus = false
