class_name Grid
extends Node2D

@export var width : int = 12
@export var height : int = 12
@export var cell_size: int = 128

var grid : Dictionary = {}

@export var show_debug: bool = false

func generateGrid():
	for x in width:
		for y in height:
			grid[Vector2(x,y)] = null
			if show_debug:
				var rect = ReferenceRect.new()
				rect.position = gridToWorld(Vector2(x,y))
				rect.size = Vector2(cell_size, cell_size)
				rect.editor_only = false
				add_child(rect)
				var label = Label.new()
				label.position = gridToWorld(Vector2(x,y))
				label.text = str(Vector2(x,y))
				add_child(label)


####### convert grid coordinates to world coordinates ########
func gridToWorld(_pos: Vector2) -> Vector2:
	return _pos * cell_size

##### To get the grid position ###########
func worldToGrid(_pos : Vector2) -> Vector2:
	####### Floor function is rounds down to the nearest grid position ##########
	return floor(_pos / cell_size)


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
