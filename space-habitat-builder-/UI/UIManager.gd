# res://UI/UIManager.gd
extends CanvasLayer

@onready var hud = $HUD
@onready var build_menu = $BuildMenu
@onready var pause_menu = $PauseMenu

func _ready():
	# Initially hide menus that should not be visible
	build_menu.visible = false
	pause_menu.visible = false

func _input(event):
	# Toggle build menu
	if event.is_action_pressed("toggle_build_menu"):
		build_menu.visible = !build_menu.visible
	# Toggle pause menu (Escape key)
	if event.is_action_pressed("ui_cancel"):
		pause_menu.visible = !pause_menu.visible
