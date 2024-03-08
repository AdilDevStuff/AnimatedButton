@tool
extends EditorPlugin

var type_name: String = "AnimatedButton"
var animated_btn_script = preload("res://addons/animatedbutton/AnimatedButton.gd")
var btn_icon = preload("res://addons/animatedbutton/Button.svg")

func _enter_tree() -> void:
	add_custom_type(type_name, "Button", animated_btn_script, btn_icon)

func _exit_tree() -> void:
	remove_custom_type(type_name)
