extends Camera2D

@export var horizontal_ruler: Sprite2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	var top_left = get_screen_center_position() - (get_viewport_rect().size / 2 / zoom)
	if horizontal_ruler:
		horizontal_ruler.global_position.y = top_left.y
