# Animation Reference Guide

## 🎬 All Animations in ProjectCardAdvanced

### 1. Card Entry Animation
**Trigger**: On widget build  
**Duration**: 600ms + (index × 50ms) for stagger  
**Properties**:
- Scale: 0.95 → 1.0
- Rotate: ±0.02 radians (alternating by index)
- Opacity: Fade in
**Curve**: Default (easeInOut)

### 2. Hover Animation
**Trigger**: Mouse enter/exit  
**Duration**: 300ms  
**Properties**:
- Scale: 1.0 → 1.05
- Rotate: 0 → ±0.02
- Shadow: blur 15px → 30px, offset 8px → 15px
- Border: transparent → accent color
**Controller**: `_hoverController`

### 3. Image Parallax
**Trigger**: Hover state  
**Duration**: 300ms  
**Properties**:
- Translate Y: 0 → -5px
**Effect**: Image slides up slightly

### 4. Title Gradient & Glow
**Trigger**: Hover state  
**Duration**: 200ms  
**Properties**:
- Text shader: Solid → Gradient
- Shadow: None → Accent glow (8px blur)
**Widget**: ShaderMask + AnimatedDefaultTextStyle

### 5. Arrow Icon Rotation & Color
**Trigger**: Hover state  
**Duration**: 300ms  
**Properties**:
- Rotation: 0° → 45° (0.125 turns)
- Background: Transparent → Gradient
- Icon color: Secondary → White
**Widget**: AnimatedRotation + AnimatedContainer

### 6. Stats Bar Slide-Up
**Trigger**: On build  
**Duration**: 800ms  
**Properties**:
- Translate Y: 10px → 0
- Opacity: 0 → 1
**Curve**: easeOutCubic

### 7. Stat Items Scale
**Trigger**: On build  
**Duration**: 300ms  
**Properties**:
- Scale: 0.9 → 1.0
**Effect**: Pop-in effect

### 8. Tech Chips Stagger
**Trigger**: On build  
**Duration**: 300ms + (index × 50ms)  
**Properties**:
- Scale: 0.0 → 0.8 (idle) → 1.0 (hover)
**Curve**: easeOutBack (bouncy)

### 9. Pulse Animation (Featured Badge)
**Trigger**: Continuous loop  
**Duration**: 2000ms  
**Properties**:
- Scale: 1.0 → 1.1 → 1.0
- Shadow blur: 12px → 20px → 12px
- Shadow opacity: 0.5 → pulsing
**Controller**: `_pulseController`  
**Repeat**: Infinite

### 10. Featured Badge Entry
**Trigger**: On build  
**Duration**: 600ms  
**Properties**:
- Scale: 0 → 1.0
- Rotate: 0.5 rad → 0
**Widget**: TweenAnimationBuilder

### 11. Ripple Effect
**Trigger**: Mouse enter  
**Duration**: 1000ms  
**Properties**:
- 3 concentric circles
- Radius: 0 → maxRadius
- Opacity: 0.3 → 0 (fade out)
- Stagger: 100ms between ripples
**Controller**: `_rippleController`  
**Painter**: RipplePainter

### 12. Shimmer Effect
**Trigger**: Active during hover  
**Duration**: 1500ms  
**Properties**:
- Linear gradient sweep
- Direction: Top-left → Bottom-right
**Controller**: `_shimmerController`  
**Repeat**: Infinite  
**Painter**: ShimmerPainter

### 13. Hover Overlay Blur
**Trigger**: Hover state  
**Duration**: 200ms  
**Properties**:
- Opacity: 0 → 1
- Blur: 0 → 10px
- Background gradient fade in
**Widget**: BackdropFilter

### 14. "View Project" Button
**Trigger**: Hover state  
**Duration**: 300ms  
**Properties**:
- Scale: 0 → 1.0
- Shadow blur: 20px → 30px
- Shadow spread: 0 → 5px
- Multi-layer shadows animate
**Widget**: TweenAnimationBuilder

## 🎮 Animation Controllers

### Primary Controllers
```dart
_hoverController: 300ms (on-demand)
_shimmerController: 1500ms (repeating)
_pulseController: 2000ms (repeating)
_rippleController: 1000ms (on-demand)
```

### Derived Animations
```dart
_scaleAnimation: 1.0 → 1.05
_rotateAnimation: 0 → 0.02
_slideAnimation: Offset(0,0) → Offset(0,-10)
_fadeAnimation: 0.0 → 1.0
_pulseAnimation: 1.0 → 1.1
```

## ⚡ Animation Timing Chart

```
Timeline:
0ms     ┃ Card starts appearing
0-600ms ┃ Card scale + rotate entry
100ms   ┃ Stats bar starts slide-up
300ms   ┃ First tech chip appears
350ms   ┃ Second tech chip appears
400ms   ┃ Third tech chip appears
800ms   ┃ Stats bar fully visible
900ms   ┃ All entry animations complete

On Hover:
0ms     ┃ Hover detected
0ms     ┃ Ripple starts (3 waves)
0-300ms ┃ Card scale/rotate
0-200ms ┃ Title gradient transition
0-300ms ┃ Image parallax
0-200ms ┃ Overlay fade in
0-300ms ┃ Tech chips scale up
1000ms  ┃ Ripple complete

Continuous:
Every 1500ms ┃ Shimmer sweep
Every 2000ms ┃ Featured badge pulse
```

## 🎨 Animation Curves Used

- **easeInOut**: Smooth start and end (default)
- **easeOutCubic**: Fast start, slow end (stats bar)
- **easeOutBack**: Bouncy overshoot (tech chips)
- **linear**: Constant speed (shimmer)

## 💡 Performance Tips

### Optimized
✅ Animations only active when needed  
✅ Controllers disposed properly  
✅ Repaint boundaries implicit  
✅ GPU-accelerated transforms  
✅ Conditional widget building

### Best Practices
```dart
// Good: Start animation on demand
_rippleController.forward(from: 0);

// Good: Stop when not needed
if (!_isHovered) return SizedBox.shrink();

// Good: Dispose all controllers
@override
void dispose() {
  _hoverController.dispose();
  _shimmerController.dispose();
  _pulseController.dispose();
  _rippleController.dispose();
  super.dispose();
}
```

## 🔧 Customization Guide

### Change Animation Speed
```dart
// Faster hover response
_hoverController = AnimationController(
  vsync: this,
  duration: const Duration(milliseconds: 150), // was 300
);

// Slower pulse
_pulseController = AnimationController(
  vsync: this,
  duration: const Duration(milliseconds: 3000), // was 2000
)..repeat(reverse: true);
```

### Adjust Animation Intensity
```dart
// More dramatic scale
_scaleAnimation = Tween<double>(
  begin: 1.0,
  end: 1.1, // was 1.05
).animate(_hoverController);

// Bigger pulse
_pulseAnimation = Tween<double>(
  begin: 1.0,
  end: 1.15, // was 1.1
).animate(_pulseController);
```

### Change Animation Curves
```dart
// Bouncier hover
_scaleAnimation = Tween<double>(
  begin: 1.0,
  end: 1.05,
).animate(CurvedAnimation(
  parent: _hoverController,
  curve: Curves.elasticOut, // was easeInOut
));
```

## 🎯 Animation Combinations

### Entry Sequence
1. Card scale + rotate (staggered by index)
2. Featured badge pop-in (if featured)
3. Stats bar slide-up
4. Tech chips stagger in
5. Pulse begins (continuous)

### Hover Sequence
1. Ripple expands (1000ms)
2. Card scales/rotates (300ms)
3. Image parallax (300ms)
4. Title gradient (200ms)
5. Overlay fades in (200ms)
6. Button scales in (300ms)
7. Shimmer activates (continuous)

### Exit Sequence
1. All hover animations reverse
2. Ripple resets
3. Shimmer stops
4. Pulse continues

## 📊 Animation Layers (Z-Index)

```
Layer 10: Shimmer Effect (overlay)
Layer 9:  Hover Overlay + Button
Layer 8:  Featured Badge
Layer 7:  Ripple Effect
Layer 6:  Animated Border
Layer 5:  Content (Title, Stats, Chips)
Layer 4:  Image Section
Layer 3:  Glass Background
Layer 2:  Shadow
Layer 1:  Container
```

## 🐛 Troubleshooting

### Animation Not Smooth?
- Check device performance
- Reduce concurrent animations
- Use `const` constructors where possible
- Consider disabling effects on low-end devices

### Animation Stuck?
- Ensure controllers are initialized
- Check dispose is called
- Verify animation state
- Reset controllers if needed

### Jank/Stutter?
- Profile with DevTools
- Check widget rebuild count
- Use `RepaintBoundary` if needed
- Reduce shadow complexity

## 📝 Quick Reference

| Animation | Duration | Trigger | Repeats |
|-----------|----------|---------|---------|
| Card Entry | 600ms | Build | No |
| Hover | 300ms | Mouse | No |
| Pulse | 2000ms | Auto | Yes |
| Ripple | 1000ms | Hover | No |
| Shimmer | 1500ms | Hover | Yes |
| Stats | 800ms | Build | No |
| Chips | 300ms | Build | No |

---

**Total Animations**: 14  
**Active Controllers**: 4  
**Custom Painters**: 2  
**Performance**: Excellent ⚡
