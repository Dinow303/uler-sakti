extends Area2D

@export var cells := 20
@export var cells_size := 50

func randomize_position(occupied: Array):
	var pos := Vector2.ZERO
	while true:
		pos = Vector2(
			randi() % cells,
			randi() % cells
		)
		if not occupied.has(pos):
			break
	position = (pos * cells_size) + Vector2(0, cells_size)
