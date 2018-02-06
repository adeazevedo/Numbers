
extends PanelContainer

signal object_received (object)

func _ready():
	DragHandler.listen(self)

	connect("object_received", self, "_receive")


func receive (obj):
	if obj == null: return false

	if _receive (obj):
		emit_signal("object_received", obj)


func _receive (obj):
	if obj == null: return false

	if obj.get_parent().has_method("drag_release"):
		obj.get_parent().drag_release(obj)
	else:
		obj.get_parent().remove_child(obj)
		
	add_child(obj)

	return true
