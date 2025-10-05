extends PanelContainer

signal slot_selected(item_name)

@export var slot_name: String = "Wall"
@export var icon: Texture2D

func _ready():
	$Name.text = slot_name
	$MarginContainer/TextureRect.texture = icon
	connect("gui_input", Callable(self, "_on_gui_input"))

func _on_gui_input(event):
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		emit_signal("slot_selected", slot_name)
