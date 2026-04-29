# UI / design system

- **Colors**: `lib/core/utils/assets/app_colors.dart` — e.g. `AppColors.primaryLight`, `AppColors.backgroundDark`, theme-aware pairs for light/dark.
- **Typography / fonts**: `lib/core/utils/assets/app_fonts.dart` and `lib/core/theme/app_theme.dart` (Tajawal for Arabic support).
- **Responsive**: `responsive_framework` (`ResponsiveBreakpoints`, etc.) — follow patterns in `lib/app.dart` and existing sections.
- **Reusable widgets**: Prefer `lib/core/widgets/common/` and section folders under `lib/core/widgets/` before duplicating layout.

New UI should match the existing portfolio look (clean, high contrast, sectioned layout).
