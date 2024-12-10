extends TextureButton

# Signal to notify when an item is clicked
signal item_clicked

# Exported property for the item's name
@export var item_name: String = "Unnamed Item"

func _ready() -> void:
	# Connect the 'pressed' signal to detect clicks
	connect("pressed", Callable(self, "_on_button_pressed"))

func _on_button_pressed() -> void:
	# Emit the signal when clicked
	emit_signal("item_clicked", item_name)
	print(item_name, " was clicked!")
