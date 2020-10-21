extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export(NodePath) var patrol_path
var patrol_points
var patrol_points_index = 0
var velocite = Vector2()
var speed = 3000
var target = Vector2()

# Called when the node enters the scene tree for the first time.
func _ready():
	if patrol_path:
		patrol_points = get_node(patrol_path).curve.get_baked_points()

func _process(delta):
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if !patrol_path:
		return
	var target = patrol_points[patrol_points_index]
	if position.distance_to(target) < 1:
		patrol_points_index = wrapi(patrol_points_index + 1, 0, patrol_points.size())
		target = patrol_points[patrol_points_index]
	velocite = (target - position).normalized() * speed
	velocite = move_and_slide(velocite*delta)
