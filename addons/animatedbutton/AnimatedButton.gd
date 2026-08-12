class_name AnimatedButton
extends Button

# ---------- Exported Variables ---------- #
@export_range(0, 10, 0.001, "or_greater") var duration: float = 0.2

@export_group("Animation Settings")
@export var transition_type: Tween.TransitionType = Tween.TRANS_SINE
@export var easing_type: Tween.EaseType = Tween.EASE_OUT

@export_group("Scale Properties")
@export var animate_scale: bool = true
@export var scale_intensity: float = 1.1

@export_group("Position Properties")
@export var animate_position: bool = false
@export var position_offset: Vector2 = Vector2(0, 0)

@export_group("Custom Properties")
@export var custom_animations: Array[CustomHoverProperty] = []

# ---------- Private Variables ---------- #
var hover_tween: Tween
var default_custom_values: Dictionary = {}

# ---------- Built-in Functions ---------- #
func _ready() -> void:
	offset_transform_enabled = true
	offset_transform_pivot_ratio = Vector2(0.5, 0.5)
	
	for anim in custom_animations:
		if anim and not anim.property_path.is_empty():
			var path := NodePath(anim.property_path)
			default_custom_values[anim.property_path] = get_indexed(path)
	
	mouse_entered.connect(_on_mouse_entered)
	mouse_exited.connect(_on_mouse_exited)

# ---------- Signal Handlers ---------- #
func _on_mouse_entered() -> void:
	_animate_button(true)

func _on_mouse_exited() -> void:
	_animate_button(false)

# ---------- Animation Logic ---------- #
func _animate_button(is_hovered: bool) -> void:
	if not animate_scale and not animate_position and custom_animations.is_empty():
		return

	if hover_tween and hover_tween.is_valid():
		hover_tween.kill()

	hover_tween = create_tween().set_parallel(true)
	hover_tween.set_trans(transition_type)
	hover_tween.set_ease(easing_type)

	if animate_scale:
		var target_scale = Vector2(scale_intensity, scale_intensity) if is_hovered else Vector2.ONE
		hover_tween.tween_property(self, "offset_transform_scale", target_scale, duration)

	if animate_position:
		var target_position = position_offset if is_hovered else Vector2.ZERO
		hover_tween.tween_property(self, "offset_transform_position", target_position, duration)
		
	for anim in custom_animations:
		if anim and not anim.property_path.is_empty():
			var path := NodePath(anim.property_path)
			var target = anim.hover_value if is_hovered else default_custom_values[anim.property_path]
			hover_tween.tween_property(self, path, target, duration)
