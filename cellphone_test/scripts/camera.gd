extends Node2D

#var mouse_pos_distance
#var pos
#
#func _process(delta):
#	if Input.is_action_just_pressed("move_camera"):
#		pos = get_viewport().get_mouse_position() - self.global_position
#	if Input.is_action_pressed('move_camera'):
#		slide_map_around()
#
## slides the map around
#func slide_map_around():
#	$Tween.interpolate_property(self,"position",self.position,get_viewport().get_mouse_position() + pos,0.1,Tween.TRANS_LINEAR,Tween.EASE_OUT)
#	$Tween.start()