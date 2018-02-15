
extends "res://scripts/gui/DroppableContainer.gd"

signal slot_cleared

var slot = null

func _receive (obj):
	if !obj is load("res://scripts/NumberPanel.gd"): return false
	if  slot != null: return false

	slot = obj
	return ._receive(obj)


func clear():
	if slot == null: return

	remove_child(slot)
	clear_slot()
	emit_signal("slot_cleared")


func clear_slot():
	slot = null
	print("cleared")


func drag_release (obj):
	clear()


func get_value():
	if slot == null: return null

	return slot.value