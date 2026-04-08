# topic_resource.gd
extends Resource
class_name TopicResource

@export var id: String
@export_multiline var default_text: String

@export var unlocks: Array[String] = []
