extends Area2D

var speed=200
var velocity=Vector2()
onready var lifetime_timer = $LifeTimer

var direction:Vector2

func _ready():
	pass 

func _physics_process(delta):
	position += direction * speed * delta

func initialize(container, position:Vector2, target:Vector2):
	container.add_child(self)
	self.direction = target
	global_position = position
	lifetime_timer.connect("timeout", self, "_on_lifetime_timer_timeout")
	lifetime_timer.start()

func _on_lifetime_timer_timeout():
	call_deferred("_remove")
	
func _remove():
	get_parent().remove_child(self)
	queue_free()
