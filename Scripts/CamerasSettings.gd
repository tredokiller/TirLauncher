extends Node2D

class_name CamerasSettings

onready var reconnect_button = $Canvas/Parent/ReconnectButton

func _ready():
	reconnect_button.connect("button_up", self, "on_reconnect_button_pressed")


func on_reconnect_button_pressed():
	WebSocketTransfer.try_to_connect()
