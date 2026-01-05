extends Node

@export var snake_scene :PackedScene
@onready var score_hud: CanvasLayer = $score_hud
@onready var snake: Node2D = $Snake

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
	score_hud.get_node("score_label").text = "Score: %d" % score

func _on_wait_time_timeout() -> void:
	if gamestarted:
		snake.move_snake()
		snake.update_snake()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
