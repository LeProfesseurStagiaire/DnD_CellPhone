extends Node

var drag_mouse = false
var mouse_over = false
var mouse_clicked = false
var node_dragged = false
var mouse_pos_distance

func _ready():
	var scale_x = ($s.get_rect().size.x/2)*$s.scale.x
	var scale_y = ($s.get_rect().size.y/2)*$s.scale.y
	$panel.rect_position = Vector2(scale_x*-1,scale_y*-1)
	$panel.margin_right = scale_x
	$panel.margin_bottom = scale_y

func _process(delta):
	if Input.is_action_pressed("click"):
		if !mouse_clicked && mouse_over:
			node_dragged = true
			mouse_pos_distance = get_viewport().get_mouse_position() - self.global_position
			get_parent().move_child(self,self.get_parent().get_child_count())
		mouse_clicked = true
	else:
		mouse_clicked = false
		node_dragged = false
	
	if node_dragged :
		$Tween.interpolate_property(self,"position",self.position,get_viewport().get_mouse_position() - mouse_pos_distance,0.1,Tween.TRANS_LINEAR,Tween.EASE_OUT)
		$Tween.start()

func _on_panel_mouse_entered():
	mouse_over = true

func _on_panel_mouse_exited():
	mouse_over = false