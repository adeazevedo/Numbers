extends Node2D

var current_path setget set_curr_path, get_curr_path
var pos_index setget set_index, get_index


func init(path, index):
	current_path = path
	pos_index = index


func set_curr_path (path):
	current_path = path


func get_curr_path():
	return current_path


func set_index (index):
	pos_index = index

	if current_path != null:
		position = current_path.get_output_position(index)


func get_index():
	return pos_index