extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if $Plateformefin/Area2D.isFinished:
		$Player/Camera2D.clear_current()
		$CameraFin.make_current()
		$Player.isFinished = true
		$Player.velocity.x = 0
		$Player/AnimatedSprite.play("Idle")
		$EcranFin/Panel/Label.text = "Bravo!!!"
		$EcranFin._fini()
	if $Player.isDead:
		$Player/Camera2D.clear_current()
		$CameraFin.make_current()
		$EcranFin/Panel/Label.text = "Vous êtes mort..."
		$EcranFin._fini()
