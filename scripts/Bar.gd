
extends Node2D

var value = 0 setget set_value

func set_value (v):
	value = v
	value = clamp(value, 0, 100)
	$ProgressBar.value = value


func _on_Sum_pressed():
	set_value(value + 1)


func _on_Sub_pressed():
	set_value(value - 1)


func _on_Mult_pressed():
	set_value(value * 2)


func _on_Div_pressed():
	set_value(value / 2)
