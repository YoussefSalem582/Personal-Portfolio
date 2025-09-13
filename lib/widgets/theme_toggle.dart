import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/theme_provider.dart';
import '../theme/app_theme.dart';

class ThemeToggle extends StatelessWidget {
  final bool isCompact;

  const ThemeToggle({super.key, this.isCompact = false});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, child) {
        return AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          child: InkWell(
            onTap: themeProvider.toggleTheme,
            borderRadius: BorderRadius.circular(20),
            child: Container(
              padding: EdgeInsets.all(isCompact ? 8 : 12),
              decoration: BoxDecoration(
                color: themeProvider.isDarkMode
                    ? AppTheme.darkSurfaceColor
                    : AppTheme.surfaceColor,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: themeProvider.isDarkMode
                      ? AppTheme.darkAccentColor.withOpacity(0.3)
                      : AppTheme.accentColor.withOpacity(0.3),
                  width: 1,
                ),
                boxShadow: [
                  BoxShadow(
                    color: themeProvider.isDarkMode
                        ? Colors.black.withOpacity(0.2)
                        : Colors.black.withOpacity(0.1),
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    child: Icon(
                      themeProvider.isDarkMode
                          ? Icons.dark_mode
                          : Icons.light_mode,
                      color: themeProvider.isDarkMode
                          ? AppTheme.darkAccentColor
                          : AppTheme.accentColor,
                      size: isCompact ? 18 : 20,
                    ),
                  ),
                  if (!isCompact) ...[
                    const SizedBox(width: 8),
                    AnimatedSwitcher(
                      duration: const Duration(milliseconds: 200),
                      child: Text(
                        themeProvider.isDarkMode ? 'Dark' : 'Light',
                        key: ValueKey(themeProvider.isDarkMode),
                        style: TextStyle(
                          color: themeProvider.isDarkMode
                              ? AppTheme.darkTextPrimary
                              : AppTheme.textPrimary,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class ThemeToggleSwitch extends StatelessWidget {
  const ThemeToggleSwitch({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, child) {
        return Container(
          width: 56,
          height: 28,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            color: themeProvider.isDarkMode
                ? AppTheme.darkAccentColor
                : AppTheme.accentColor.withOpacity(0.3),
          ),
          child: Stack(
            children: [
              AnimatedPositioned(
                duration: const Duration(milliseconds: 200),
                curve: Curves.easeInOut,
                left: themeProvider.isDarkMode ? 30 : 2,
                top: 2,
                child: GestureDetector(
                  onTap: themeProvider.toggleTheme,
                  child: Container(
                    width: 24,
                    height: 24,
                    decoration: BoxDecoration(
                      color: themeProvider.isDarkMode
                          ? AppTheme.darkSurfaceColor
                          : AppTheme.surfaceColor,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          blurRadius: 2,
                          offset: const Offset(0, 1),
                        ),
                      ],
                    ),
                    child: Icon(
                      themeProvider.isDarkMode
                          ? Icons.dark_mode
                          : Icons.light_mode,
                      size: 14,
                      color: themeProvider.isDarkMode
                          ? AppTheme.darkAccentColor
                          : AppTheme.accentColor,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
