
extends Node

var position = Vector2()
var current_event = null
var previous_event = null


func _input (event):
	if !(event is InputEventMouseButton or event is InputEventMouseMotion):
		return

	position = get_viewport().get_mouse_position()


func is_pressed (event, button = BUTTON_LEFT):
	return 	event is InputEventMouseButton and \
			event.button_mask & button and \
			event.pressed


func is_released (event, button = BUTTON_LEFT):
	return	event is InputEventMouseButton and \
			!event.pressed and \
			event.button_index == button


static func is_in_motion (event):
	return 	event is InputEventMouseMotion


func is_holding_left (event):
	return 	(event is InputEventMouseButton or
			event is InputEventMouseMotion) and \
			event.button_mask & BUTTON_MASK_LEFT


func is_holding_right (event):
	return 	(event is InputEventMouseButton or
			event is InputEventMouseMotion) and \
			event.button_mask & BUTTON_MASK_RIGHT


func is_hovering(event, container):
	return 	container.get_global_rect().has_point(event.position)