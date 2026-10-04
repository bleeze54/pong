extends Sprite2D
@export var speed =400
var sccreen_size

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	sccreen_size = get_viewport_rect().size


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var velocity = Vector2.ZERO
	if Input.is_key_pressed(KEY_Z):
		velocity.y-=1
	if Input.is_key_pressed(KEY_S):
		velocity.y+=1
	if velocity.length()>0:
		velocity=velocity.normalized()*speed
	position += velocity * delta
	position=position.clamp(Vector2.ZERO,sccreen_size)


func _on_area_2d_body_entered(body: Node2D) -> void:
	pass
