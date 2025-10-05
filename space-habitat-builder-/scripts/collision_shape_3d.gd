extends CollisionShape3D
@export var default_size: Vector3 = Vector3(1, 1, 1)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var mesh_node = get_parent().get_node_or_null("MeshInstance3D")
	if mesh_node and mesh_node.mesh:
		var aabb = mesh_node.mesh.get_aabb()
		if shape is BoxShape3D:
			shape.size = aabb.size
		else:
			print("CollisionShape3D is not a BoxShape3D, using default size")
			shape.size = default_size
			
	pass # Replace with function body.

	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
