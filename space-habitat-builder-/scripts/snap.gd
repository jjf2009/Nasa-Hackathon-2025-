extends Area3D

@export var default_size: Vector3 = Vector3(1, 1, 1)
@export var id: int

signal snap_detected(ids: Array)

func _ready() -> void:
	# Connect to detect overlaps
	connect("area_entered", Callable(self, "_on_area_entered"))

func _on_area_entered(area: Area3D) -> void:
	# Only react if the other area is also a snap node
	if area.is_in_group("snap"):
		var other_id = area.id
		var ids = [id, other_id]
		emit_signal("snap_detected", ids)
