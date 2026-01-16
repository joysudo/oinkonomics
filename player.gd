extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -700.0


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_up") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	
	if global_position.y > 1200:
		global_position = Vector2(100, 100)
		velocity = Vector2.ZERO
	
	if is_on_floor():
		var target_angle = get_floor_normal().angle() + PI/2
		$AnimatedSprite2D.rotation = lerp_angle($AnimatedSprite2D.rotation, target_angle, 0.2)
		if direction != 0:
			$AnimatedSprite2D.play("walk")
			$AnimatedSprite2D.flip_h = (direction < 0)
		else:
			$AnimatedSprite2D.play("idle")
	else:
		$AnimatedSprite2D.rotation = lerp_angle($AnimatedSprite2D.rotation, 0, 0.1)

	move_and_slide()
