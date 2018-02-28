extends Node2D

var Connection = preload("res://RoundPath_connection.tscn")
var output_positions = []
var outputs = []
var outputs_draw = false

func _ready():
	output_positions = [
		Vector2(7, 12), Vector2(30, 12), Vector2(53, 12),
		Vector2(76, 12), Vector2(99, 12), Vector2(122, 12),
		Vector2(145, 12), Vector2(168, 12), Vector2(191, 12)
	]


func _physics_process (delta):
	update()


func _draw():
	if !outputs_draw:
		for index in outputs:
			var c = Connection.instance()
			c.set_position(output_positions[index])
			c.show()
			add_child(c)
			outputs_draw = true


func set_outputs (arr):
	outputs = arr


func get_output_position (index):
	if index < 0: return output_positions[0]
	if index >= output_positions.size(): return output_positions[output_positions.size() - 1]

	return output_positions[index]