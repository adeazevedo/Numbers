extends Control

var panel = null

func create (panel):
	self.panel = panel.duplicate(true)
	self.panel.modulate.a = .3
	self.panel.set_position(Vector2())
	set_mouse_filter(MOUSE_FILTER_IGNORE)
	set_position(Mouse.position)
	show()

	if !panel.is_connected("on_drag", self, "update_position"):
		panel.connect("on_drag", self, "update_position")

	add_child(self.panel)


func update_position():
	set_position(Mouse.position)


func show():
	if panel == null: return

	.show()
	panel.show()


func hide():
	if panel == null: return

	.hide()
	panel.hide()


func destroy():
	hide()
	get_parent().remove_child(self)
	queue_free()