
extends Node

var object = null setget set_object, get_object
var droppable_list = {}
var elem_hovered = null


func set_object (obj = null):
	if obj == null:
		if has_object():
			if object.is_connected("on_drag", self, "object_on_drag"):
				object.disconnect("on_drag", self, "object_on_drag")

	object = obj

	if has_object():
		if !object.is_connected("on_drag", self, "object_on_drag"):
			object.connect("on_drag", self, "object_on_drag")



func get_object ():
	return object


func has_object ():
	return object != null


func pick (obj):
	set_object(obj)
	print("New Object Dragged")


func drop ():
	if elem_hovered == null:
		print("Elem Hovered is null. Returning object to original position")
		return

	elem_hovered.receive(object)

	DragHandler.set_object(null)
	elem_hovered = null

## Method called when mouse moves with a drag object
func object_on_drag ():
	var pos = Mouse.position

	if has_object():
		for elem in droppable_list.keys():
			if elem.get_rect().has_point(pos):
				elem_hovered = elem

				return

			else:
				elem_hovered = null

## Droppable elements have to register on DragHandler
func listen (droppable):
	if droppable == null: return

	droppable_list[droppable] = 1