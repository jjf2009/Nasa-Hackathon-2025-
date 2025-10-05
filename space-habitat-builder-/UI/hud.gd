# res://UI/HUD.gd
extends Control

@onready var health_bar: TextureProgressBar = $HealthBar
@onready var stamina_bar: TextureProgressBar = $StaminaBar
@onready var oxygen_bar: TextureProgressBar = $OxygenBar

func _ready() -> void:
	# Initialize default values (safe-guard)
	health_bar.min_value = 0
	health_bar.max_value = 100
	health_bar.value = 100

	stamina_bar.min_value = 0
	stamina_bar.max_value = 100
	stamina_bar.value = 100

	oxygen_bar.min_value = 0
	oxygen_bar.max_value = 100
	oxygen_bar.value = 100

# Public API — call these from gameplay scripts (Player, LifeSupport, etc.)
func set_health(value: float) -> void:
	health_bar.value = clamp(value, health_bar.min_value, health_bar.max_value)

func set_stamina(value: float) -> void:
	stamina_bar.value = clamp(value, stamina_bar.min_value, stamina_bar.max_value)

func set_oxygen(value: float) -> void:
	oxygen_bar.value = clamp(value, oxygen_bar.min_value, oxygen_bar.max_value)

# OPTIONAL: debug/test keys — remove or comment out in production
func _input(event):
	if event is InputEventKey and event.pressed:
		match event.scancode:
			KEY_H: set_health(health_bar.value - 10)   # press H to damage
			KEY_J: set_health(health_bar.value + 10)   # press J to heal
			KEY_K: set_stamina(stamina_bar.value - 10) # press K to drain stamina
			KEY_L: set_stamina(stamina_bar.value + 10) # press L to restore stamina
			KEY_O: set_oxygen(oxygen_bar.value - 10)   # press O to reduce oxygen
			KEY_P: set_oxygen(oxygen_bar.value + 10)   # press P to increase oxygen
