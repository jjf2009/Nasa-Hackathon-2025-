extends Area3D

@export var default_size: Vector3 = Vector3(1, 1, 1)
@export var data: TextEdit

signal snap_detected(ids: Array)

func _ready() -> void:
	connect("area_entered", Callable(self, "_on_area_entered"))

func _on_area_entered(area: Area3D) -> void:
	if area.is_in_group("snap"):
		var collected = []

		collected.append({
			"id": get_instance_id(),
			"data": data
		})

		collected.append({
			"id": area.get_instance_id(),
			"data": area.data
		})

		var parent = area.get_parent()
		for child in parent.get_children():
			if child.is_in_group("snap") and child != area:
				collected.append({
					"id": child.get_instance_id(),
					"data": child.data
				})

		emit_signal("snap_detected", collected)
