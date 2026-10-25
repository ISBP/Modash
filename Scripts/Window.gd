extends Control

@onready var height: TextEdit = $HeightBox/Height
@onready var length: TextEdit = $LengthBox/Length
@onready var grass: TextureRect = $GrassBounds/Grass
@onready var grass_bounds: Control = $GrassBounds
@onready var water_usage: Label = $info/waterUsage

const SPRINKLER = preload("uid://20rvk28jtt60")
const SPRINKLER_SIZE = 16

const MAX_HEIGHT = 100
const MAX_LENGHT = 100




var maxHeight = 100.0
var maxLength = 100.0


var heightValue:float 
var lengthValue:float





# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	maxHeight = grass_bounds.size.y
	maxLength = grass_bounds.size.x
	
	heightValue = height.text.to_float()
	lengthValue = length.text.to_float()
	
	changeGrassSize(lengthValue, heightValue)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	

func changeGrassSize(grassL:float, grassH:float):
	water_usage.text = "Your lawn needs\n" + str(round(0.623 * grassH * grassL )) +"\ngallons of water\na week"
	
	grassL *= 600
	grass.size.x = grassL
	grass.position.x = (grass_bounds.size.x/2.0) - (grass.size.x*grass.scale.x/2.0)
	
	grassH *= 600
	grass.size.y = grassH
	grass.position.y = (grass_bounds.size.y/2.0) - (grass.size.y*grass.scale.y/2.0)
	
	


func _on_height_text_changed() -> void:
	textChanged(height)
	heightValue = height.text.to_float()
	changeGrassSize(lengthValue, heightValue)
	




func _on_length_text_changed() -> void:
	textChanged(length)
	lengthValue = length.text.to_float()
	changeGrassSize(lengthValue, heightValue)
	
	
	

func textChanged(node:TextEdit):
	node.text = str(node.text.to_int())
	node.text = node.text.left(4) + " Feet"
	
	node.set_caret_column(node.text.length() - 5)

#func placeSprinklers():
	#var numSprinklersL:int = round(lengthValue/radiusValue + 0.5)
	#var numSprinklersH:int = round(heightValue/radiusValue + 0.5)
	#var numSprinklers:int = numSprinklersH * numSprinklersL
	#for h in numSprinklersH:
			#for l in numSprinklersL:
				#var alternatingOffset = 0
				#if h % 2 == 0: alternatingOffset = 1
				#var xPosition = (SPRINKLER_SIZE * l) + SPRINKLER_SIZE*alternatingOffset
				#var yPosition = -SPRINKLER_SIZE * h
				#createSprinkler(Vector2(xPosition, yPosition), radiusValue)
			#

#func createSprinkler(sprinklerPosition:Vector2, sprinklerRadius:float):
	#var child = SPRINKLER.instantiate()
	#child.position = sprinklerPosition
	#var offset = -(sprinklerRadius * 16)/2
	#child.find_child("Radius").position = Vector2(offset,offset)
	#child.find_child("Radius").scale = Vector2(radiusValue, radiusValue)
	#grass_bounds.add_child(child)


func _on_button_pressed() -> void:
	pass # Replace with function body.
