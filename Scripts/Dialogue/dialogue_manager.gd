extends Node

signal node_changed(node_data)
signal topics_changed(topics)
signal dialogue_started()
signal dialogue_ended()

var current_node : Dictionary
var node_stack : Array = []

var unlocked_topics : Array = []
var nodes : Dictionary = {}
var topics_db : Dictionary = {}

var current_npc: NPCDialogueProfile

func start_with_npc(node_id: String, npc: NPCDialogueProfile):
	current_npc = npc
	start(node_id)

func load_resource(res: DialogueResource):
	var data = build_lookup(res)
	nodes = data[0]
	topics_db = data[1]

func build_lookup(resource: DialogueResource):
	var nodes_dict = {}
	var topics_dict = {}
	
	for node in resource.nodes:
		nodes_dict[node.id] = node
	
	for topic in resource.topics:
		topics_dict[topic.id] = topic
	
	return [nodes_dict, topics_dict]

func _go_to(node_id):
	current_node = nodes[node_id]
	
	for t in current_node.unlock_topics:
		if t not in unlocked_topics:
			unlocked_topics.append(t)
	
	emit_signal("topics_changed", unlocked_topics)
	emit_signal("node_changed", current_node)

func can_access_topic(topic: TopicResource) -> bool:
	for flag in topic.required_flags:
		if not unlocked_topics.has(flag):
			return false
	return true

func npc_knows_topic(topic_id: String) -> bool:
	if current_npc.known_topics.is_empty():
		return true # knows all by default
	
	return topic_id in current_npc.known_topics

func start(node_id: String):
	current_node = nodes[node_id]
	node_stack.clear()
	emit_signal("dialogue_started")
	emit_signal("node_changed", current_node)
	emit_signal("topics_changed", unlocked_topics)

func choose(index: int):
	var choice = current_node.choices[index]

	# Skill check example
	if choice.has("skill_check"):
		if not _passes_check(choice.skill_check):
			_go_to(choice.get("fail", ""))
			return

	_go_to(choice.next)

func ask_topic(topic_id: String):
	if not topics_db.has(topic_id):
		return

	node_stack.push_back(current_node)

	var text = get_topic_text(topic_id)

	current_node = {
		"text": text,
		"choices": [{"text": "Back", "next": "__back"}]
	}

	emit_signal("node_changed", current_node)

func end():
	emit_signal("dialogue_ended")

func _passes_check(check: Dictionary) -> bool:
	# stub
	return true

func get_topic_text(topic_id: String) -> String:
	var topic = topics_db[topic_id]

	# NPC override
	if current_npc and topic_id in current_npc.topic_overrides:
		return current_npc.topic_overrides[topic_id]

	# fallback
	return topic.default_text
