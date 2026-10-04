extends RigidBody2D
@onready var collision_shape:CircleShape2D = $CollisionShape2D.shape
@export var speed =600
var screen_size:Vector2
var velocity = Vector2.ZERO
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	position=Vector2(300,300)
	screen_size = get_viewport_rect().size
	velocity.y-=1
	velocity.x+=1
		
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	velocity=velocity.normalized()*speed
	if (position.y+collision_shape.radius >= screen_size.y or position.y-collision_shape.radius <= 0) :

		velocity.y=-velocity.y;
	if (position.x+collision_shape.radius >= screen_size.x or position.x-collision_shape.radius <= 0) :
		velocity.x=-velocity.x
	position += velocity * delta
	
	print_debug(position.y,"  ",position.x)
