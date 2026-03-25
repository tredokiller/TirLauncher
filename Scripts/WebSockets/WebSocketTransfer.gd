extends Node

var websocket_data := WebSocketData.new()
var ws := WebSocketClient.new()

var connected := false

func _ready():
	ws.connect("connection_established", self, "_on_connected")
	ws.connect("connection_error", self, "_on_connection_error")
	ws.connect("connection_closed", self, "_on_closed")
	ws.connect("data_received", self, "_on_data_received")

func try_to_connect():
	var err = ws.connect_to_url("ws://127.0.0.1:33513")
	if err != OK:
		print("WebSocket connect error: ", err)

func _process(delta):
	ws.poll()

func _on_connected(protocol = ""):
	connected = true
	print("Connected to frame server")

func _on_connection_error():
	print("Connection error")

func _on_closed(was_clean = false):
	connected = false
	print("Connection closed")

func _on_data_received():
	var peer = ws.get_peer(1)
	var packet = peer.get_packet()
	# We expect binary JPEG data
	var img = Image.new()
	var err = img.load_jpg_from_buffer(packet)
	if err != OK:
		print("Failed to decode jpg: ", err)
		return
	websocket_data.image_texture.create_from_image(img, 0)
