
extends Node

var position = Vector2()
var current_event = null
var previous_event = null


func _input (event):
	if !(event is InputEventMouseButton or event is InputEventMouseMotion):
		return

	previous_event = current_event
	current_event = event
	position = get_viewport().get_mouse_position()


func is_pressed (button = BUTTON_LEFT, event = current_event):
	return 	event is InputEventMouseButton and \
			event.button_index == button and \
			event.pressed


func is_released (button = BUTTON_LEFT, event = current_event):
	return	event is InputEventMouseButton and \
			event.button_index == button and \
			!event.pressed


func is_click (button = BUTTON_LEFT, event = current_event):
	if previous_event == null: return false

	return 	is_pressed(previous_event, button) and \
			is_released(event, button)


func is_in_motion (event = current_event):
	return 	event is InputEventMouseMotion


func is_holding_left (event = current_event):
	return 	(event is InputEventMouseButton or
			event is InputEventMouseMotion) and \
			event.button_mask == BUTTON_MASK_LEFT


func is_holding_right (event = current_event):
	return 	(event is InputEventMouseButton or
			event is InputEventMouseMotion) and \
			event.button_mask == BUTTON_MASK_RIGHT


func is_hovering(container, event = current_event):
	return 	container.get_global_rect().has_point(event.position)


func exited (container, event = current_event):
	if previous_event == null: return true

	return 	is_hovering(container, previous_event) and \
			!is_hovering(container, event)


func entered (container, event = current_event):
	if previous_event == null: return true

	return 	!is_hovering(container, previous_event) and \
			is_hovering(container, event)