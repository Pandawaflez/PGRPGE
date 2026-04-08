# dialogue_node.gd
extends Resource
class_name DialogueNode

@export var id: String
@export_multiline var text: String

@export var choices: Array[DialogueChoice] = []
@export var unlock_topics: Array[String] = []
