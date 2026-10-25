extends HTTPRequest
@onready var temp: Label = $"../Temp"
@onready var humid: Label = $"../Humid"
@onready var drop_down: TextureRect = $"../Button/dropDown"

const offScreen = 1000
# Called when the node enters the scene tree for the first time.
var json
var parsed = false

func _ready():
	request_completed.connect(_on_request_completed)
	request("https://almond.pbsi.xyz/data")

func _on_request_completed(result, response_code, headers, body):
	json = JSON.parse_string(body.get_string_from_utf8())
	parsed = true
	print("parse string")

func setCity(name:String):
	if parsed:
		temp.text = str(json[str(name)+"Temp"]) + " F"
		humid.text = str(json[str(name)+"Humid"]) + " "


func _on_button_pressed() -> void:
	drop_down.position.y = 0


func _on_modesto_pressed() -> void:
	drop_down.position.y = offScreen
	setCity("modesto")


func _on_fresno_pressed() -> void:
	drop_down.position.y = offScreen
	setCity("fresno")


func _on_clovis_pressed() -> void:
	drop_down.position.y = offScreen
	setCity("clovis")


func _on_merced_pressed() -> void:
	drop_down.position.y = offScreen
	setCity("merced")


func _on_mantica_pressed() -> void:
	drop_down.position.y = offScreen
	setCity("mantica")
