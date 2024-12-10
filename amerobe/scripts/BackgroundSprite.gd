extends Sprite2D

func _ready() -> void:
	# Get the screen size
	var screen_size = get_viewport_rect().size

	# Get the texture size
	if texture:
		var texture_size = texture.get_size()

		# Calculate the scale to fill the screen while keeping the aspect ratio
		var scale_x = screen_size.x / texture_size.x
		var scale_y = screen_size.y / texture_size.y

		# Choose the larger scale factor to cover the entire screen
		var scale_factor = max(scale_x, scale_y)
		scale = Vector2(scale_factor, scale_factor)

		# Center the background
		position = screen_size / 2
