extends Node2D

var targetPos
var velocity = Vector2(0,-1)

# Called when the node enters the scene tree for the first time.
func _ready():
	position = Vector2(300,200)
	targetPos = position
	pass # Replace with function body.

func _process(delta):
	
	var directionToTarget : Vector2 = targetPos - position
	
	var errorAngle	= velocity.angle_to(directionToTarget)
	
	var turnAngle	= lerp(0,errorAngle,0.05)
	
	var linearSpeed	
	
	linearSpeed = lerp(0,directionToTarget.clamped(60).length(),0.02)*2
	
	velocity = velocity.rotated(turnAngle)
	
	rotation = velocity.angle()
	
	position += velocity*linearSpeed
	
	update_label_info("\n"+ " angle speed: " + str(turnAngle) + "\n"+ 
	" linear speed: " + str(linearSpeed) + "\n"+
	" distance: " + str(directionToTarget.length()))
	
	pass

func update_label_info(info : String):
	var labelNode = $"../Label"
	labelNode.text = info
	pass	

func _draw():	
	var triangle_points1 = [Vector2(26, 0), Vector2(-13,-15), Vector2(-13,15)]
	draw_colored_polygon(triangle_points1, Color(0, 0, 0))


	var triangle_points = [Vector2(20, 0), Vector2(-10,-10), Vector2(-10,10)]
	draw_colored_polygon(triangle_points, Color(1, 0, 0))


func _input(event):
	#if event is InputEventMouseButton and event.button_index == BUTTON_LEFT and event.is_pressed():
	targetPos = get_global_mouse_position()

	
