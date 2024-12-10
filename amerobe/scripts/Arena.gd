extends Node2D

# Variables for score and weight
var score: int = 0
var weight: float = 140.0  # Weight in pounds

# Conversion factor: 10 points = 1 pound
const POINTS_TO_WEIGHT = 10.0

func _ready() -> void:
	# Connect signals for all food items in the FoodContainer
	for food_item in $FoodContainer.get_children():
		food_item.connect("item_clicked", Callable(self, "_on_food_item_clicked"))

func _on_food_item_clicked(item_name: String) -> void:
	# Points based on the clicked food item
	var points = 0
	match item_name:
		"Burger Item":
			points = 20
		"Fries Item":
			points = 10
		"Soda Item":
			points = 5

	# Update score and weight
	score += points
	weight += points / POINTS_TO_WEIGHT

	# Print the interaction
	print("Arena: Clicked on ", item_name, " - Points: ", points, " - Total Score: ", score, " - Weight: ", weight, " lbs")

	# Serialize and print the game state
	_save_game_state()

func _save_game_state() -> void:
	# Create a dictionary to represent the game state
	var game_state = {
		"score": score,
		"weight": weight,
		"food_positions": _get_food_positions()
	}

	# Serialize to JSON
	var serialized_state = game_state
	print(game_state)

	# Print the serialized state to the console
	print("Serialized Game State: ", serialized_state)

	# Placeholder for sending state to a Rust binding
	# Uncomment the line below to send the state to Rust
	# _send_to_rust(serialized_state)

func _get_food_positions() -> Array:
	# Retrieve the positions of all food items
	var positions = []
	for food_item in $FoodContainer.get_children():
		positions.append({
			"name": food_item.item_name,
			"position": food_item.position
		})
	return positions

# Placeholder for sending state to a Rust binding
# Replace this function with your Rust integration code
func _send_to_rust(serialized_state: String) -> void:
	# Example: Sending serialized state to Rust DLL
	# rust_binding.send_game_state(serialized_state)
	print("Sending state to Rust: (commented out)")
