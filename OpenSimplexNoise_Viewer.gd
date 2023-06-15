extends Control

# The OpenSimplexNoise object.
onready var noise=OpenSimplexNoise.new() 

# Various noise parameters.
var min_noise 
var max_noise 
var ScreenResulation=Vector2(800,600)
var cordXY=Vector2()

# Called when the node enters the scene tree for the first time.
func _ready():
	# Set up noise with basic info.
	$ParameterContainer/SeedSpinBox.value = noise.seed
	$ParameterContainer/LacunaritySpinBox.value = noise.lacunarity
	$ParameterContainer/PeriodSpinBox.value = noise.period
	$ParameterContainer/PersistenceSpinBox.value = noise.persistence
	$ParameterContainer/OctavesSpinBox.value = noise.octaves
	_refresh_shader_params()
	
	


func _refresh_shader_params():
		# Get the texture data and lock it (to allow editing)
	# Generate some Noise for the height map
	
	#for x in range(ScreenResulation.x):
	#	for y in range(ScreenResulation.y):
	#		cordXY.x=x
	#		cordXY.x=y
	$TileMap.clear()
			#get_node("TileMap").set_cellv((cordXY),-1)
	
	
	
	var noise = OpenSimplexNoise.new()
	noise.seed =  $ParameterContainer/SeedSpinBox.value
	noise.octaves =$ParameterContainer/OctavesSpinBox.value
	noise.period = $ParameterContainer/PeriodSpinBox.value
	noise.persistence = $ParameterContainer/PersistenceSpinBox.value
	noise.lacunarity=$ParameterContainer/LacunaritySpinBox.value 
	for x in range(ScreenResulation.x): # loop over the whole x-Axis
		# Get the height for this x position
		cordXY.x=x
		
		# Since the noise is between -1 and 1 we add 1 to not get negative numbers
		# We then multiply by 40% of the map height such that the height can cover 80% of the screen
		# Finally we add 8% of the map height to kinda center the terrain
		var high = ((noise.get_noise_1d(x) + 1) * ScreenResulation.y * 0.4) + ScreenResulation.y * 0.08
		
		cordXY.y=high
		
		get_node("TileMap").set_cellv(get_node("TileMap").world_to_map(cordXY),0)
		#if Map==null:
		#	print("Null")
		

			# Al
			


func _on_DocumentationButton_pressed():
	#warning-ignore:return_value_discarded
	OS.shell_open("https://docs.godotengine.org/en/latest/classes/class_opensimplexnoise.html")


func _on_RandomSeedButton_pressed():
	$ParameterContainer/SeedSpinBox.value = floor(rand_range(-2147483648, 2147483648))
	_refresh_shader_params()

func _on_SeedSpinBox_value_changed(value):
	noise.seed = value
	_refresh_shader_params()

func _on_LacunaritySpinBox_value_changed(value):
	noise.lacunarity = value
	_refresh_shader_params()

func _on_PeriodSpinBox_value_changed(value):
	noise.period = value
	_refresh_shader_params()

func _on_PersistenceSpinBox_value_changed(value):
	noise.persistence = value
	_refresh_shader_params()

func _on_OctavesSpinBox_value_changed(value):
	noise.octaves = value
	_refresh_shader_params()

func _on_MinClipSpinBox_value_changed(value):
	min_noise = value



func _on_MaxClipSpinBox_value_changed(value):
	max_noise = value
	


func _on_Generate_new_toggled(button_pressed):
	
	pass # Replace with function body.
