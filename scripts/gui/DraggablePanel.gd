tool
extends Panel

signal on_begin_drag
signal on_drag
signal on_end_drag

var preview = null
var dragging = false

func _gui_input (event):
	if Mouse.is_pressed(BUTTON_LEFT, event):
		dragging = true

	if dragging and Mouse.is_in_motion(event):
		if preview == null:
			preview = load("res://scripts/gui/DragPreview.gd").new()
			preview.create(self)
			get_tree().root.add_child(preview)

			DragHandler.pick(self)
			emit_signal("on_begin_drag")

		emit_signal("on_drag")

	if dragging and Mouse.is_released(BUTTON_LEFT, event):
		if preview == null: return

		dragging = false
		destroy_preview()

		DragHandler.drop()
		emit_signal("on_end_drag")


func destroy_preview():
	if preview == null: return

	preview.destroy()
	preview = null