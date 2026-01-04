extends Node

@export var snake_scene :PackedScene
@onready var score_hud: CanvasLayer = $score_hud
# game var
var score:int
var gamestarted : bool = false
# BG grid var/size
var cells:int = 20
var cells_size:int = 50
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
	newgame()

func newgame():
	score = 0
	score_hud.get_node("score_label").text = "Score: %d" % score
	can_move = true
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

func input():
	if not can_move:
		return
	if Input.is_action_pressed("ui_up") and direction != Vector2.DOWN:
		next_direction = Vector2.UP
	elif Input.is_action_pressed("ui_down") and direction != Vector2.UP:
		next_direction = Vector2.DOWN
	elif Input.is_action_pressed("ui_left") and direction != Vector2.RIGHT:
		next_direction = Vector2.LEFT
	elif Input.is_action_pressed("ui_right") and direction != Vector2.LEFT:
		next_direction = Vector2.RIGHT

func move_snake():
	direction = next_direction
	old_data = snake_data.duplicate()
	# move body
	for i in range(snake_data.size() - 1, 0, -1):
		snake_data[i] = snake_data[i - 1]
	# move head
	snake_data[0] += direction

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass