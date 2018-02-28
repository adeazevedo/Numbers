extends Node2D

var RoundPath = preload("res://RoundPath.tscn")
var Slider_ = preload("res://Slider.tscn")

var outputs = []
var number_of_paths = 0
var path = []

onready var slider = Slider_.instance()

func _ready():
	outputs.append([5])
	outputs.append([2, 3])

	var number_of_paths  = outputs.size() + 1

	# Creating Path object
	for i in range(number_of_paths):
		var p = RoundPath.instance()

		if i < number_of_paths - 1:
			p.set_outputs(outputs[i])

		path.append(p)

		# Adding Paths to world
		p.show()
		p.position = Vector2(0, -i * 45)
		add_child(p)

		slider.current_path = path[0]
		slider.pos_index = 4
		add_child(slider)


func _input (event):
	if Input.is_action_pressed("plus"):
		slider.pos_index = min(slider.pos_index + 1, 9)

	if Input.is_action_pressed("minus"):
		slider.pos_index = max(slider.pos_index - 1, 0)

	if Input.is_action_pressed("mult"):
		slider.pos_index = max((slider.pos_index+1) * 2, 0)

	if Input.is_action_pressed("div"):
		slider.pos_index = min((slider.pos_index+1) / 2, 9)

	pass


