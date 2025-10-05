extends CharacterBody3D

@export var sens = 0.002
@onready var obj = "res://scenes/snappytest.tscn"


@export var SPEED = 5.0
@export var JUMP_VELOCITY = 4.5

@onready var camG = $Camera3D
@onready var sT = $Camera3D/RayCast3D

var sA = false
var flag : bool = 1
var temp

func _ready() -> void:
	get_tree().connect("node_added", Callable(self, "_on_node_added"))

func _on_node_added(node: Node) -> void:
	if node.is_in_group("BBox"):
		node.connect("success", Callable(self, "_on_bbox_success"))

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("modes"):
		flag = not flag
	if flag:
		Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	else:
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	if  not flag:
		sT.enabled  = true
		sT.target_position = camG.project_local_ray_normal(get_viewport().get_mouse_position()) * 1000
		sT.force_raycast_update()
		if sT.is_colliding():
			#print("Saw something")
			#print(sT.get_collider())
			#if Input.is_action_just_pressed("Lclick"):
			if sT.get_collider().get_parent().has_method("shame") and sA:
					sT.get_collider().get_parent().shame(sA.get_parent(),temp)
					
			if Input.is_action_just_pressed("Rclick"):
				sA = sT.get_collider()
				temp = sA.get_parent().global_transform
				print(sA.get_parent())
		
func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		if flag:
			rotation.y = rotation.y - event.relative.x * sens
			camG.rotation.x = camG.rotation.x - event.relative.y * sens
func _on_bbox_success():
	print("success")
	sA = null

func _physics_process(delta: float) -> void:
	# Add the gravity.
	#if not is_on_floor():
	#	velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_pressed("ascend"):
		velocity.y = JUMP_VELOCITY
	elif Input.is_action_pressed("descent"):
		velocity.y = -JUMP_VELOCITY
	else:
		velocity.y = 0

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_dir := Input.get_vector("left", "right", "up", "down")
	var direction := (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)
	
					
				

	move_and_slide()


#func _on_cyltest_success() -> void:
	#sA = null


#func _on_boxtest_success() -> void:
	#sA = null
