extends Node2D

@export var snake_scene :PackedScene
@export var cells_size:int = 50
@export var cells:int = 20

# snake var
var old_data : Array = []
var snake_data : Array = []
var snake : Array = []
# movement var
var starting_pos = Vector2(9,9)
var can_move : bool = false
var direction := Vector2.RIGHT
var next_direction := Vector2.RIGHT

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	generate_snake()

func generate_snake():
	old_data.clear()
	snake_data.clear()
	snake.clear()
	for i in range(3):
		add_segment(starting_pos + Vector2(-i, 0))

func add_segment(_pos:Vector2):
	snake_data.append(_pos)
	var SnakeSegment = snake_scene.instantiate()
	SnakeSegment.position = (_pos * cells_size) + Vector2(0, cells_size)
	snake.append(SnakeSegment)
	add_child(SnakeSegment)

func move_snake():
	direction = next_direction
	old_data = snake_data.duplicate()
	# move body
	for i in range(snake_data.size() - 1, 0, -1):
		snake_data[i] = snake_data[i - 1]
	# move head
	snake_data[0] += direction

func update_snake():
	for i in range(snake.size()):
		snake[i].position = (snake_data[i] * cells_size) + Vector2(0, cells_size)
		print("POS:", snake[i].position)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
