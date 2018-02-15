
extends "res://scripts/gui/DraggablePanel.gd"

export(int) var value = 0 setget set_value, get_value


func _ready():
	connect("resized", self, "_on_NumberPanel_resized")


func get_value():
	return value


func set_value (v):
	value = v

	if has_node("Label"):
		$Label.text = String(v)


func _on_NumberPanel_resized():
	if has_node("Label"):
		$Label.rect_size = rect_size