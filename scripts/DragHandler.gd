
extends Node

var object = null

func set_object(obj = null):
	if obj == null or obj is load("res://scripts/DraggablePanel.gd"):
		object = obj


func get_object():
	return object


func has_object():
	return object != null


func drop(container):
	object.destroy_preview()
	object.get_parent().remove_child(object)
	container.add_child(object)

	object = null