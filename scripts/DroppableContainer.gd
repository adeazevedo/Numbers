
extends Container

enum CursorState {CURSOR_INSIDE, CURSOR_OUTSIDE}
var cursor_state = CURSOR_OUTSIDE

signal droppable_enter(object)
signal droppable_exit(object)
signal object_dropped(object)


var light = 0.0
export(bool) var border_highlight_visible = true setget set_border_visible
var highlight_on = false
var highlight_color = Color(.7, .7, 0, 1)

# TODO: Highlight should have a separated class

func _physics_process(delta):
	if highlight_on:
		process_hightlight()
		update()


func _input (event):
	if !DragHandler.has_object(): return

	var drag_obj = DragHandler.get_object()

	if Mouse.entered(self):
		emit_signal("droppable_enter", drag_obj)

		if Mouse.is_released():
			emit_signal("object_dropped", drag_obj)

	if Mouse.exited(self):
		emit_signal("droppable_exit", drag_obj)


func set_border_visible(b):
	border_highlight_visible = b


func start_highlight(obj = null):
	if border_highlight_visible == true:
		highlight_on = true


func end_highlight(obj = null):
	print("end")
	highlight_on = false
	light = 0
	highlight_color.a = 0

	update()


func process_hightlight():
	var x = deg2rad(light)
	var w = .5 * sin(5 * (x - PI/2)) + .5
	var alpha = lerp(0, 1, w)
	highlight_color.a = alpha
	light += 1


func _draw():
	if !highlight_on: return

	var r = get_global_rect()

	draw_line(Vector2(), Vector2(0, r.size.x), highlight_color, 3)
	draw_line(Vector2(), Vector2(r.size.y, 0), highlight_color, 3)
	draw_line(Vector2(r.size.x, r.size.y), Vector2(0, r.size.x), highlight_color, 3)
	draw_line(Vector2(r.size.x, r.size.y), Vector2(r.size.y, 0), highlight_color, 3)