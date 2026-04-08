# npc_dialogue_profile.gd
extends Resource
class_name NPCDialogueProfile

@export var name: String

# Overrides: topic_id → custom response
@export var topic_overrides: Dictionary = {}

# Optional: topics this NPC knows
@export var known_topics: Array[String] = []
