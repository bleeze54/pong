extends RigidBody2D
@onready var collision_shape:CircleShape2D = $CollisionShape2D.shape
@export var speed =800
var screen_size:Vector2
var velocity = Vector2.ZERO

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	position=Vector2(300,300)
	screen_size = get_viewport_rect().size
	linear_velocity = Vector2(-1, -1).normalized() * speed

		
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	#print_debug(position.y,"  ",position.x)

func _physics_process(_delta: float) -> void:
	var radius = collision_shape.radius
	
	# Rebond Horizontal (Gauche / Droite)
	if position.x - radius <= 0:
		position.x = radius # Replace le corps à l'intérieur
		linear_velocity.x = abs(linear_velocity.x) # Force la vitesse vers la droite
	elif position.x + radius >= screen_size.x:
		position.x = screen_size.x - radius
		linear_velocity.x = -abs(linear_velocity.x) # Force la vitesse vers la gauche

	# Rebond Vertical (Haut / Bas)
	if position.y - radius <= 0:
		position.y = radius
		linear_velocity.y = abs(linear_velocity.y) # Force la vitesse vers le bas
	elif position.y + radius >= screen_size.y:
		position.y = screen_size.y - radius
		linear_velocity.y = -abs(linear_velocity.y) # Force la vitesse vers le haut

	# Détection du CharacterBody2D
	var bodies = get_colliding_bodies()
	for body in bodies:
		if body is CharacterBody2D:
			print("Collision en cours avec le personnage : ", body.name)
		
