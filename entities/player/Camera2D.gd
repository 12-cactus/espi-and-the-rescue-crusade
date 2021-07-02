extends Camera2D

onready var raycast: RayCast2D = $RayCast2D

var _left_raycast: RayCast2D
var _right_raycast: RayCast2D
var _bottom_raycast: RayCast2D
var _up_raycast: RayCast2D

func _ready():
	raycast.visible = true
	
	_left_raycast = raycast.duplicate()
	_left_raycast.set_cast_to(Vector2.LEFT * 100)
	
	_right_raycast = raycast.duplicate()
	_right_raycast.set_cast_to(Vector2.RIGHT * 100)
	
	_bottom_raycast = raycast.duplicate()
	_bottom_raycast.set_cast_to(Vector2.DOWN * 100)
	
	_up_raycast = raycast.duplicate()
	_up_raycast.set_cast_to(Vector2.UP * 100)
	
	add_child(_left_raycast)
	add_child(_right_raycast)
	add_child(_bottom_raycast)
	add_child(_up_raycast)
	
	remove_child(raycast)

func _physics_process(delta):
	drag_margin_left = 0.2 if _left_raycast.is_colliding() else lerp(0.2, drag_margin_left, 0.9)
	drag_margin_right = 0.2 if _right_raycast.is_colliding() else lerp(0.2, drag_margin_right, 0.9)
	drag_margin_bottom = 0.2 if _bottom_raycast.is_colliding() else lerp(0.2, drag_margin_bottom, 0.9)
	drag_margin_top = 0.2 if _up_raycast.is_colliding() else lerp(0.2, drag_margin_top, 0.9)
	

