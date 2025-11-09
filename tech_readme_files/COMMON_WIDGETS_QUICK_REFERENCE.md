# Common Widgets Quick Reference

## Available Common Widgets

### Layout & Structure

#### 1. SectionHeader
**File:** `lib/widgets/common/section_header.dart`  
**Use:** Consistent section headers across all sections

```dart
SectionHeader(
  title: 'My Section',
  subtitle: 'Description text',
  dividerWidth: 80,
  useShaderMask: true, // For gradient text effect
  isMobile: isMobile,
)
```

#### 2. EmptyState
**File:** `lib/widgets/common/empty_state.dart`  
**Use:** No content / empty list states

```dart
EmptyState(
  icon: Icons.folder_open,
  message: 'No items found',
  subtitle: 'Add your first item to get started',
  actionLabel: 'Add Item',
  onActionPressed: () => _addItem(),
)
```

---

### Cards & Containers

#### 3. AnimatedCard
**File:** `lib/widgets/common/animated_card.dart`  
**Use:** Cards with hover effects and animations

```dart
AnimatedCard(
  padding: EdgeInsets.all(16),
  hoverBorderColor: Colors.blue,
  onTap: () => _handleTap(),
  child: YourContent(),
)
```

**Benefits:**
- Automatic hover state management
- Built-in scale animation
- No need for StatefulWidget
- No manual AnimationController

#### 4. InfoCard
**File:** `lib/widgets/common/info_card.dart`  
**Use:** Information display with icon + title + content

```dart
InfoCard(
  icon: Icons.calendar_today,
  title: 'DATE',
  content: 'January 2024',
  iconColor: Colors.blue,
)
```

#### 5. GradientContainer
**File:** `lib/widgets/common/gradient_container.dart`  
**Use:** Containers with gradient backgrounds

```dart
GradientContainer(
  colors: [Colors.blue, Colors.purple],
  borderRadius: 16,
  child: YourContent(),
)
```

---

### Icons & Badges

#### 6. IconBadge
**File:** `lib/widgets/common/icon_badge.dart`  
**Use:** Icon with label badge

```dart
IconBadge(
  icon: Icons.check_circle,
  label: 'Verified',
  backgroundColor: Colors.green,
  iconColor: Colors.white,
)

// Positioned variant
PositionedBadge(
  icon: Icons.picture_as_pdf,
  label: 'PDF',
  position: BadgePosition.topRight,
)
```

#### 7. IconContainer
**File:** `lib/widgets/common/common_widgets.dart`  
**Use:** Icon with gradient background

```dart
IconContainer(
  icon: Icons.star,
  size: 44,
  iconSize: 22,
  shape: BoxShape.circle,
  gradientColors: [Colors.blue, Colors.purple],
)
```

---

### Text & Typography

#### 8. GradientText
**File:** `lib/widgets/common/common_widgets.dart`  
**Use:** Text with gradient shader effect

```dart
GradientText(
  text: '100+',
  style: TextStyle(fontSize: 34, fontWeight: FontWeight.bold),
  gradientColors: [Colors.blue, Colors.purple],
)
```

**Replaces:**
```dart
// OLD WAY (verbose)
ShaderMask(
  shaderCallback: (bounds) => LinearGradient(
    colors: [Colors.blue, Colors.purple],
  ).createShader(bounds),
  child: Text('100+', style: TextStyle(color: Colors.white)),
)

// NEW WAY (simple)
GradientText(text: '100+', gradientColors: [Colors.blue, Colors.purple])
```

---

### UI Elements

#### 9. CustomShowMoreButton
**File:** `lib/widgets/custom_show_more_button.dart`  
**Use:** Load more / show more buttons

```dart
CustomShowMoreButton(
  label: 'Load More Projects',
  onPressed: _loadMore,
  isLoading: isLoading,
)
```

#### 10. ThemeToggleButtonContainer
**File:** `lib/widgets/common/theme_toggle_button_container.dart`  
**Use:** Styled container for theme toggle button

```dart
ThemeToggleButtonContainer(
  child: IconButton(
    icon: Icon(Icons.brightness_4),
    onPressed: _toggleTheme,
  ),
)
```

---

### Utilities

#### 11. ResponsiveSpacing
**File:** `lib/widgets/common/common_widgets.dart`  
**Use:** Screen-size adaptive spacing

```dart
// Vertical spacing
ResponsiveSpacing(
  mobile: 8,
  tablet: 12,
  desktop: 16,
)

// Horizontal spacing
ResponsiveSpacing(
  mobile: 16,
  isHorizontal: true,
)
```

---

## Migration Patterns

### Pattern 1: Manual Animation → AnimatedCard

**BEFORE:**
```dart
class MyCard extends StatefulWidget {
  @override
  State<MyCard> createState() => _MyCardState();
}

class _MyCardState extends State<MyCard> with SingleTickerProviderStateMixin {
  bool _isHovered = false;
  late AnimationController _controller;
  
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );
  }
  
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: Card(...),
    );
  }
}
```

**AFTER:**
```dart
class MyCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AnimatedCard(
      child: YourContent(),
    );
  }
}
```

**Saves:** ~40-60 lines per widget

---

### Pattern 2: ShaderMask Text → GradientText

**BEFORE:**
```dart
ShaderMask(
  shaderCallback: (bounds) => LinearGradient(
    colors: isDark
        ? [AppColors.accentDark, AppColors.accentDark.withOpacity(0.8)]
        : [AppColors.accentLight, AppColors.primaryLight],
  ).createShader(bounds),
  child: Text(
    'My Text',
    style: TextStyle(
      fontSize: 34,
      color: Colors.white,
      fontWeight: FontWeight.bold,
    ),
  ),
)
```

**AFTER:**
```dart
GradientText(
  text: 'My Text',
  style: TextStyle(fontSize: 34, fontWeight: FontWeight.bold),
)
```

**Saves:** ~10-15 lines per usage

---

### Pattern 3: Icon Container → IconContainer

**BEFORE:**
```dart
Container(
  padding: const EdgeInsets.all(12),
  decoration: BoxDecoration(
    shape: BoxShape.circle,
    gradient: LinearGradient(
      colors: [
        accentColor.withOpacity(0.2),
        accentColor.withOpacity(0.1),
      ],
    ),
  ),
  child: Icon(Icons.star, size: 22, color: accentColor),
)
```

**AFTER:**
```dart
IconContainer(
  icon: Icons.star,
  size: 46,
  iconSize: 22,
  shape: BoxShape.circle,
)
```

**Saves:** ~12-18 lines per usage

---

### Pattern 4: Info Display → InfoCard

**BEFORE:**
```dart
Container(
  padding: const EdgeInsets.all(16),
  decoration: BoxDecoration(
    color: isDark ? AppColors.surfaceDark : AppColors.gray50,
    borderRadius: BorderRadius.circular(12),
    border: Border.all(color: ...),
  ),
  child: Row(
    children: [
      Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          gradient: LinearGradient(...),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Icon(Icons.calendar, size: 22, color: accentColor),
      ),
      SizedBox(width: 16),
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('DATE', style: ...),
            SizedBox(height: 6),
            Text('January 2024', style: ...),
          ],
        ),
      ),
    ],
  ),
)
```

**AFTER:**
```dart
InfoCard(
  icon: Icons.calendar,
  title: 'DATE',
  content: 'January 2024',
)
```

**Saves:** ~50-70 lines per usage

---

## When to Create a New Common Widget

Consider creating a new common widget when:

1. **Pattern appears 3+ times** across different files
2. **Code block is 20+ lines** and self-contained
3. **Similar variations** exist in multiple places
4. **Theme-dependent styling** is repeated
5. **Animation/interaction pattern** is duplicated

## Benefits Tracking

- **Code Reduction:** ~65% average across refactored widgets
- **Maintainability:** Single source of truth for common patterns
- **Consistency:** Uniform behavior and styling
- **Testing:** Test once, use everywhere
- **Productivity:** Faster development with building blocks
- **StatefulWidget Elimination:** Simpler state management

---

## Import Statements

```dart
// Basic common widgets
import 'package:personal_portfolio/widgets/common/section_header.dart';
import 'package:personal_portfolio/widgets/common/empty_state.dart';
import 'package:personal_portfolio/widgets/common/animated_card.dart';
import 'package:personal_portfolio/widgets/common/info_card.dart';
import 'package:personal_portfolio/widgets/common/gradient_container.dart';
import 'package:personal_portfolio/widgets/common/icon_badge.dart';
import 'package:personal_portfolio/widgets/common/theme_toggle_button_container.dart';

// Multiple components in one file
import 'package:personal_portfolio/widgets/common/common_widgets.dart';
// Includes: IconContainer, GradientText, ResponsiveSpacing

// Button
import 'package:personal_portfolio/widgets/custom_show_more_button.dart';
```

---

## Common Parameters Reference

### Colors
- `iconColor` - Icon color (defaults to theme accent)
- `backgroundColor` - Background color
- `borderColor` - Border color
- `gradientColors` - List of colors for gradients
- `hoverBorderColor` - Border color on hover

### Sizing
- `size` - Overall component size
- `iconSize` - Icon size
- `padding` - Internal padding
- `margin` - External margin
- `borderRadius` - Corner radius
- `borderWidth` - Border thickness

### Behavior
- `enableHoverEffect` - Enable/disable hover
- `enableScaleAnimation` - Enable/disable scale on hover
- `animationDuration` - Animation speed
- `onTap` / `onPressed` - Click handlers

### Display
- `isMobile` - Mobile layout flag
- `useShaderMask` - Enable gradient text effect
- `shape` - BoxShape.circle or BoxShape.rectangle
- `elevation` - Shadow elevation

---

**Last Updated:** Phase 2 Complete  
**Total Common Widgets:** 11  
**Total Reusable Lines:** 875+
