class_name AnimatedButton
extends Button

# ---------- Exported Variables ---------- #
@export_range(0, 10, 0.001, "or_greater") var duration = 0.1

@export var animate_scale: bool = true
@export var animate_position: bool = false
@export var transition_type: Tween.TransitionType

@export_group("Scale Properties", "scale_")
@export var scale_intensity: float = 1.1

@export_group("Position Properties", "position_")
@export var position_value: Vector2 = Vector2(0, -4)

# ---------- Private Variables ---------- #

var tween: Tween
var btn_start_pos

var is_btn_hovered: bool = false

# ---------- Built-in Functions ---------- #

func _ready() -> void:
	# Set the pivot offset at center
	pivot_offset = size / 2
	btn_start_pos = position 

func _process(delta: float) -> void:
	set_button_state()
	hover_scale_animation()
	hover_position_animation()

# ---------- Signals ---------- #

func set_button_state():
	if self.is_hovered():
		is_btn_hovered = true
	else:
		is_btn_hovered = false

func hover_scale_animation():
	if animate_scale:
		if is_btn_hovered:
			tweening(self, "scale", Vector2(scale_intensity, scale_intensity), duration)
		else:
			tweening(self, "scale", Vector2.ONE, duration)

func hover_position_animation():
	if animate_position:
		if is_btn_hovered:
			tweening(self, "position", btn_start_pos + Vector2(position_value.x, position_value.y), duration)
		else:
			tweening(self, "position", btn_start_pos, duration)

# Global tween method
func tweening(object: Object, property: NodePath, final_value: Variant, duration: float):
	tween = create_tween().set_parallel(true).set_trans(transition_type)
	tween.tween_property(object, property, final_value, duration)
	await tween.finished
	tween.kill()
