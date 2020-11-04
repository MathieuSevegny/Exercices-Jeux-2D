extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var isFinished

# Called when the node enters the scene tree for the first time.
func _ready():
	 isFinished = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Area2D_body_entered(body):
	if "Player" in body.name:
		if !body.is_jumping:
			isFinished = true
