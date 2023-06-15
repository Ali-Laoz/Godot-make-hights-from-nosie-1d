extends Camera2D


export var zoom_speed=0.001
export var move_speed=1

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _process(delta):
	if Input.get_action_strength("ui_page_up"):
		#zoom.set(Vector2(cnt,cnt))
		zoom -= Vector2(zoom_speed,zoom_speed)
		#print(zoom)
	
	if Input.get_action_strength("ui_page_down"):
		zoom += Vector2(zoom_speed,zoom_speed)
		#print(zoom)
	
	if Input.get_action_strength("ui_left"):
		offset-=Vector2(move_speed,0)
		
	if Input.get_action_strength("ui_right"):
		offset+=Vector2(move_speed,0)	
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
