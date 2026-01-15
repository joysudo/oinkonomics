extends Node2D

var signs_found = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for child in get_children():
		if "Sign" in child.name:
			child.sign_activated.connect(_on_sign_discovered)
	update_ui()

func _on_sign_discovered():
	signs_found += 1
	update_ui()
	if signs_found >= 13:
		finish_game()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func update_ui():
	$CanvasLayer/SignCounter.text = "Signs Found: " + str(signs_found)

func finish_game():
	var tween = create_tween()
	tween.tween_property($player/Camera2D, "zoom", Vector2(0.133, 0.133), 2.0).set_trans(Tween.TRANS_SINE)
	tween.tween_property($player/Camera2D, "global_position", Vector2(3800, 300), 4.0).set_trans(Tween.TRANS_SINE)
