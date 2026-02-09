extends Node2D

func _ready() -> void:
	add_to_group("map_manager")
	return

func updateProgression() -> void:
	var mapEntitiesArray = get_tree().get_nodes_in_group("map_entities")
	for entity in mapEntitiesArray:
		entity.calculateProgressionTrigger()
	return
