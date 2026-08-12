# Animated Button
A custom button node for Godot that provides smooth, container-safe hover animations by default for scale and position, plus a highly flexible system to animate any custom property!

[Screencast_20260812_202554.webm](https://github.com/user-attachments/assets/81d4bfbc-27aa-4179-b756-6d5d4affdedd)

## Features
* **Container-Safe Animations:** Uses Godot's new `offset_transform` properties. Your buttons will now animate perfectly inside `VBoxContainer`, `HBoxContainer`, and other UI layouts without fighting the container or breaking the UI flow.
* **Custom Property Animations:** You can now animate *any* property via the Inspector without writing extra code.
* **Highly Optimized:** Signal-based design uses zero CPU power while sitting idle. Smart tween management ensures animations never overlap or glitch if the mouse moves quickly.
* **Auto-Centering:** Automatically scales perfectly from its center, even if the button is dynamically resized.

## How to use
1. Simply download the addon from the releases tab and copy it into your `res://addons` folder.
2. Enable the plugin from `Project -> Project Settings -> Plugins`.
3. A new custom node called `AnimatedButton` will now appear when creating a new node.

## Properties Overview

### Animation Settings
* **`Duration`** -> The time (in seconds) it takes to complete the hover animation.
* **`Transition Type`** -> The animation curve (e.g., Sine, Bounce, Elastic).
* **`Easing Type`** -> The direction of the easing (Ease In, Ease Out, etc.) for smoother motion.

### Scale Properties
* **`Animate Scale`** -> Check if you want to animate the scale property of the button.
* **`Scale Intensity`** -> The target scale multiplier when hovered (e.g., `1.1` makes it 10% larger).

### Position Properties
* **`Animate Position`** -> Check if you want to animate the position of the button.
* **`Position Offset`** -> The relative offset (Vector2) the button will move to when hovered (e.g., `(0, -4)` moves it up 4 pixels).

### Custom Properties
* **`Custom Animations`** -> An array that accepts `CustomHoverProperty` resources. Simply type the name of the property you want to animate (like `modulate` or `theme_override_colors/font_color`) and set your target hover value!

## Ideas for the future:
- [x] Add custom properties to animate. *(Added in latest update!)*
- [ ] Add click/pressed animations (e.g., button slightly shrinks when clicked).
- [ ] Enter and exit animations like fade, pop, etc., when the UI initially loads.

---
*This custom node is still being actively worked on. I'm going to add more features into it while keeping it simple, lightweight, and easy to use.*
