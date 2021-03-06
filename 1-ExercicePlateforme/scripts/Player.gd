extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export var speed = 250
export var gravity = 1000
export var impulsion = -400
export var nbDeVie = 3
var is_jumping = false
var velocity = Vector2(0,0)
onready var anim = $AnimatedSprite
var isFinished = false
var isDead = false


# Called when the node enters the scene tree for the first time.
func _ready():
	set_vie()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	_anim_player()

func _physics_process(delta):
	velocity.y += gravity * delta
	_ctrl_player()
	if is_jumping and is_on_floor():
		is_jumping = false
	velocity = move_and_slide(velocity, Vector2(0,-1)) 

func _anim_player():
	if !isFinished:
		if !is_jumping:
			if Input.is_action_pressed("move_left"):
				anim.flip_h = true
				anim.play("Run")
			elif Input.is_action_pressed("move_right"):
				anim.flip_h = false
				anim.play("Run")
			elif Input.is_action_pressed("move_jump"):
				anim.play("Jump")
			else:
				anim.play("Idle")
		else:
			if Input.is_action_pressed("move_left"):
				anim.flip_h = true
			elif Input.is_action_pressed("move_right"):
				anim.flip_h = false
			anim.play("Jump")

func _ctrl_player():
	var droite = Input.is_action_pressed("move_right")
	var gauche = Input.is_action_pressed("move_left")
	var jump = Input.is_action_just_pressed("move_jump")
	
	if !isFinished:
		velocity.x = 0
		if droite:
			velocity.x += speed
		if gauche:
			velocity.x -= speed
		if jump and !is_jumping:
			is_jumping = true
			velocity.y = impulsion
func _dying():
	nbDeVie -= 1
	set_vie()
	if nbDeVie < 1:
		isDead = true
	else:
		position.x = 929.399
		position.y = 282.86

func set_vie():
	$Camera2D/Panel/Label.text = "Nombre de vie : " + str(nbDeVie)
