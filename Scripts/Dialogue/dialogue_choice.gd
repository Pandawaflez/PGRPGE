# dialogue_choice.gd
extends Resource
class_name DialogueChoice

@export var text: String
@export var next_node: String
@export var fail_node: String = ""

@export var required_flags: Array[String] = []
@export var skill_check: Dictionary = {} # { "speech": 40 }
