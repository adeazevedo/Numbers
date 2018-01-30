
extends Panel

signal on_begin_drag(object)
signal on_drag(object)
signal on_end_drag(object)

var dragging = false

export(bool) var preview_visibiliy = false setget set_preview_visible
var preview = null


func _gui_input(event):
	# On_begin_drag detection
	if Mouse.is_pressed() and Mouse.is_holding_left():
		dragging = true
		DragHandler.set_object(self)

		set_mouse_filter(MOUSE_FILTER_IGNORE)

		create_preview()
		emit_signal("on_begin_drag", self)

	# On_drag detection
	if dragging and Mouse.is_in_motion():
		emit_signal("on_drag", self)

		#Move preview with mouse position
		if preview == null: return

		var offset = Vector2(get_size().x / 2, get_size().y * .75)
		preview.set_position(Mouse.position - offset)

	# On_end_drag detection
	if dragging and Mouse.is_released():
		dragging = false
		destroy_preview()

		set_mouse_filter(MOUSE_FILTER_STOP)

		emit_signal("on_end_drag", self)
		DragHandler.set_object(null)


func set_preview_visible(b):
	preview_visibiliy = b


func create_preview():
	if preview == null:
		preview = self.duplicate(true)
		preview.modulate.a = .3
		preview.set_mouse_filter(MOUSE_FILTER_IGNORE)
		preview.show() if preview_visibiliy else preview.hide()
		get_parent().add_child(preview)


func destroy_preview():
	if preview == null: return

	preview.hide()
	get_parent().remove_child(preview)
	preview = null