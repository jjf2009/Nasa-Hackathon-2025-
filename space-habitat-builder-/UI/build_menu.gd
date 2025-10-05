extends PanelContainer
signal object_chosen(item_name)

func _ready():
	for slot in $MarginContainer/ObjectGrid.get_children():
		if slot.has_signal("slot_selected"):
			slot.connect("slot_selected", Callable(self, "_on_slot_selected"))

func _on_slot_selected(item_name: String):
	emit_signal("object_chosen", item_name)
