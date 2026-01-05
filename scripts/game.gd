extends Node

@export var snake_scene :PackedScene
@onready var score_hud: CanvasLayer = $score_hud
@onready var snake: Node2D = $Snake

# snake movement var
@export var can_move : bool = false
@export var direction := Vector2.RIGHT
@export var next_direction := Vector2.RIGHT

# game var
var score:int
var gamestarted : bool = false
# BG grid var/size
var cells:int = 20
var cells_size:int = 50

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	newgame()

func newgame():
	score = 0
	gamestarted = true
	can_move = true
	score_hud.get_node("score_label").text = "Score: %d" % score

func _input(event):
	if not can_move:
		return
	if event.is_action_pressed("ui_up") and direction != Vector2.DOWN:
		next_direction = Vector2.UP
	elif event.is_action_pressed("ui_down") and direction != Vector2.UP:
		next_direction = Vector2.DOWN
	elif event.is_action_pressed("ui_left") and direction != Vector2.RIGHT:
		next_direction = Vector2.LEFT
	elif event.is_action_pressed("ui_right") and direction != Vector2.LEFT:
		next_direction = Vector2.RIGHT


func _on_wait_time_timeout() -> void:
	if gamestarted:
		snake.move_snake()
		snake.update_snake()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
