extends Control

@onready var text_label = $Panel/RichTextLabel
@onready var choices_box = $Panel/Choices
@onready var topics_box = $Panel/ScrollContainer/Topics

func _ready():
	DialogueManager.node_changed.connect(_on_node_changed)
	DialogueManager.topics_changed.connect(_on_topics_changed)

func _on_node_changed(node):
	text_label.text = node.text

	_rebuild_choices(node.choices)

func _on_topics_changed(topics):
	_rebuild_topics(topics)

func _rebuild_choices(choices):
	for c in choices_box.get_children():
		c.queue_free()

	for i in choices.size():
		var btn = Button.new()
		btn.text = choices[i].text
		btn.pressed.connect(_on_choice_pressed.bind(i))
		choices_box.add_child(btn)

func _rebuild_topics(topics):
	for c in topics_box.get_children():
		c.queue_free()

	for t in topics:
		var btn = Button.new()
		btn.text = t
		btn.pressed.connect(_on_topic_pressed.bind(t))
		topics_box.add_child(btn)

func _on_choice_pressed(index):
	DialogueManager.choose(index)

func _on_topic_pressed(topic_id):
	DialogueManager.ask_topic(topic_id)
