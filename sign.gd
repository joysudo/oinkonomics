extends Area2D

signal sign_activated
var is_activated = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Label.hide()
	body_entered.connect(_on_body_entered)

func _on_body_entered(body):
	if body is CharacterBody2D and not is_activated:
		is_activated = true
		$Label.show()
		sign_activated.emit()
