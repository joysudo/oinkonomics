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
	if signs_found >= 12:
		finish_game()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func update_ui():
	$CanvasLayer/SignCounter.text = "Signs Found: " + str(signs_found)

func finish_game():
	$player.set_physics_process(false)
	var tween = create_tween()
	tween.set_parallel(true)
	tween.tween_property($player/Camera2D, "zoom", Vector2(0.133, 0.133), 2.0).set_trans(Tween.TRANS_SINE)
	tween.tween_property($player/Camera2D, "global_position", Vector2(3450, 300), 4.0).set_trans(Tween.TRANS_SINE)
	tween.tween_property($CanvasLayer/SignCounter, "modulate:a", 0.0, 1.5)
	tween.tween_property($CanvasLayer/BottomText, "modulate:a", 1.0, 2.0).set_delay(4.0)
	tween.tween_property($CanvasLayer/TopText, "modulate:a", 1.0, 2.0).set_delay(4.0)
	tween.tween_property($CanvasLayer/TextureRect, "modulate:a", 0.5, 2.0).set_delay(4.0)
	tween.tween_property($CanvasLayer/TextureRect2, "modulate:a", 0.1, 1.75).set_delay(4.25)
