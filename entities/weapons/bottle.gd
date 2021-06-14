extends Area2D

onready var lifetime_timer = $LifeTimer
onready var sprite = $Sprite
var speed = 200
var velocity = Vector2()
var direction: Vector2

func _physics_process(delta):
	position += direction * speed * delta

func initialize(container, position:Vector2, target:Vector2):
	container.add_child(self)
	self.direction = target
	global_position = position + (target * 20)
	lifetime_timer.connect("timeout", self, "_on_lifetime_timer_timeout")
	lifetime_timer.start()

func initialize2(container, position:Vector2, target:Vector2, img):
	container.add_child(self)
	self.direction = target
	global_position = position + (target * 20)
	lifetime_timer.connect("timeout", self, "_on_lifetime_timer_timeout")
	lifetime_timer.start()
	sprite.texture = load(img)

func _on_lifetime_timer_timeout():
	call_deferred("_remove")
	
func _remove():
	get_parent().remove_child(self)
	queue_free()

func _on_bottle_body_entered(body):
	if body.has_method("notify_hit"):
		body.notify_hit()
	self.collision_mask = 0
	call_deferred("_remove")
