extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$"/root/Game".isFinished = false
	$Panel.visible = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if $"/root/Game".isFinished:
		$Panel.visible = true


func _on_Button_pressed():
	get_tree().reload_current_scene()
