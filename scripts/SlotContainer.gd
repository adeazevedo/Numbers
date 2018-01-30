
extends "res://scripts/DroppableContainer.gd"

var slot = null


func _ready():
	connect("object_dropped", self, "receive_number")


func receive_number(number_panel):
	slot = number_panel
	DragHandler.drop(self)

