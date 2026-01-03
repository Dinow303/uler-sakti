extends Node

@export var snake_scene :PackedScene
@onready var score_hud: CanvasLayer = $score_hud
# game var
var score:int
var gamestarted := false
# BG grid var/size
var cells:int = 20
var cells_size:int = 50
# snake var
var old_data : Array
var snake_data : Array
var snake : Array
# movement var
var starting_pos = Vector2(9,9)
var can_move : bool


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
		add_segment(starting_pos + Vector2(0, i))

func add_segment(_pos:Vector2):
	snake_data.append(_pos)
	var SnakeSegment = snake_scene.instantiate()
	add_child(SnakeSegment)
	SnakeSegment.position = (_pos * cells_size) + Vector2(0, cells_size)
	snake.append(SnakeSegment)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
