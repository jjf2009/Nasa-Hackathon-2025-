extends Node3D

@export var building_type: String = "default"
@export var size: Vector3 = Vector3.ONE  # logical size, can be read from parent

var aabb: AABB

func _ready() -> void:
	# auto-generate from parent MeshInstance3D
	var mesh_node = get_parent().get_node_or_null("MeshInstance3D")
	if mesh_node and mesh_node.mesh:
		aabb = mesh_node.get_aabb()
		size = aabb.size
	else:
		# fallback to manual size
		aabb = AABB(global_position - size/2.0, size)

func get_global_aabb() -> AABB:
	# Returns the AABB in world space
	var xform = global_transform
	return AABB(
		xform.origin + aabb.position,
		aabb.size * xform.basis.get_scale()
	)

func is_adjacent_to(other: Node) -> bool:
	if not other.has_method("get_global_aabb"):
		return false
	var a = get_global_aabb()
	var b = other.get_global_aabb()

	# Two boxes are adjacent if they touch but don’t overlap
	var expanded_a = a.grow(0.01)  # small tolerance
	return expanded_a.intersects(b)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
