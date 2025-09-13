import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../theme/app_theme.dart';
import '../utils/responsive_helper.dart';
import '../widgets/theme_toggle.dart';

class AppNavigation extends StatelessWidget {
  final Function(int) onItemSelected;
  final int currentIndex;

  const AppNavigation({
    super.key,
    required this.onItemSelected,
    required this.currentIndex,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    if (ResponsiveHelper.isMobile(screenWidth)) {
      return _buildMobileNavigation(context);
    } else {
      return _buildDesktopNavigation(context);
    }
  }

  Widget _buildDesktopNavigation(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      height: 80,
      padding: EdgeInsets.symmetric(
        horizontal: ResponsiveHelper.getHorizontalPadding(
          MediaQuery.of(context).size.width,
        ),
      ),
      decoration: BoxDecoration(
        color: isDark ? AppTheme.darkSurfaceColor : AppTheme.surfaceColor,
        boxShadow: [
          BoxShadow(
            color: isDark ? Colors.black26 : Colors.black12,
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          // Logo/Name
          Text(
            'Youssef Salem',
            style: AppTheme.headingSmall.copyWith(
              color: isDark ? AppTheme.darkTextPrimary : AppTheme.primaryColor,
              fontWeight: FontWeight.bold,
            ),
          ),

          const Spacer(),

          // Navigation items
          Row(children: _buildNavigationItems(false)),

          const SizedBox(width: 24),

          // Theme toggle
          const ThemeToggle(isCompact: true),

          const SizedBox(width: 16),

          // Resume download button
          ElevatedButton.icon(
            onPressed: () => _downloadResume(context),
            icon: const Icon(Icons.download, size: 18),
            label: const Text('Resume'),
            style: ElevatedButton.styleFrom(
              backgroundColor:
                  isDark ? AppTheme.darkAccentColor : AppTheme.accentColor,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMobileNavigation(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return AppBar(
      backgroundColor:
          isDark ? AppTheme.darkSurfaceColor : AppTheme.surfaceColor,
      elevation: 2,
      shadowColor: isDark ? Colors.black26 : Colors.black12,
      leading: Builder(
        builder: (context) => IconButton(
          icon: Icon(
            Icons.menu,
            color: isDark ? AppTheme.darkTextPrimary : AppTheme.primaryColor,
          ),
          onPressed: () => Scaffold.of(context).openDrawer(),
        ),
      ),
      title: Text(
        'Youssef Salem',
        style: AppTheme.headingSmall.copyWith(
          color: isDark ? AppTheme.darkTextPrimary : AppTheme.primaryColor,
          fontSize: 20,
        ),
      ),
      centerTitle: true,
    );
  }

  List<Widget> _buildNavigationItems(bool isVertical) {
    final items = [
      _NavigationItem(
        title: 'Home',
        index: 0,
        isSelected: currentIndex == 0,
        onTap: () => onItemSelected(0),
        isVertical: isVertical,
      ),
      _NavigationItem(
        title: 'About',
        index: 1,
        isSelected: currentIndex == 1,
        onTap: () => onItemSelected(1),
        isVertical: isVertical,
      ),
      _NavigationItem(
        title: 'Projects',
        index: 2,
        isSelected: currentIndex == 2,
        onTap: () => onItemSelected(2),
        isVertical: isVertical,
      ),
      _NavigationItem(
        title: 'Skills',
        index: 3,
        isSelected: currentIndex == 3,
        onTap: () => onItemSelected(3),
        isVertical: isVertical,
      ),
      _NavigationItem(
        title: 'Certificates',
        index: 4,
        isSelected: currentIndex == 4,
        onTap: () => onItemSelected(4),
        isVertical: isVertical,
      ),
      _NavigationItem(
        title: 'Contact',
        index: 5,
        isSelected: currentIndex == 5,
        onTap: () => onItemSelected(5),
        isVertical: isVertical,
      ),
    ];

    if (isVertical) {
      return items;
    } else {
      return items
          .expand((item) => [item, const SizedBox(width: 32)])
          .take(items.length * 2 - 1)
          .toList();
    }
  }

  Widget buildMobileDrawer(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Drawer(
      child: Container(
        color: isDark ? AppTheme.darkSurfaceColor : AppTheme.surfaceColor,
        child: Column(
          children: [
            // Header
            Container(
              height: 120,
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: isDark
                    ? AppTheme.darkPrimaryGradient
                    : AppTheme.primaryGradient,
              ),
              child: Center(
                child: Text(
                  'Youssef Salem Hassan',
                  style: AppTheme.headingSmall.copyWith(
                    color: Colors.white,
                  ),
                ),
              ),
            ),

            // Navigation items
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(vertical: 16),
                children: [
                  ..._buildNavigationItems(true),
                  const Divider(),

                  // Theme toggle
                  ListTile(
                    leading: const Icon(
                      Icons.brightness_6,
                      color: AppTheme.accentColor,
                    ),
                    title: Text(
                      'Theme',
                      style: AppTheme.bodyLarge.copyWith(
                        color: isDark
                            ? AppTheme.darkTextPrimary
                            : AppTheme.textPrimary,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    trailing: const ThemeToggleSwitch(),
                    onTap: () {},
                  ),

                  const Divider(),

                  ListTile(
                    leading: const Icon(
                      Icons.download,
                      color: AppTheme.accentColor,
                    ),
                    title: Text(
                      'Download Resume',
                      style: AppTheme.bodyLarge.copyWith(
                        color: AppTheme.accentColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    onTap: () {
                      Navigator.of(context).pop();
                      _downloadResume(context);
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _downloadResume(BuildContext context) async {
    const url = 'assets/resume.pdf';
    try {
      final uri = Uri.parse(url);
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri, mode: LaunchMode.externalApplication);
      } else {
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Could not download resume. Please try again.'),
              backgroundColor: Colors.red,
            ),
          );
        }
      }
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Error downloading resume. Please try again.'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }
}

class _NavigationItem extends StatelessWidget {
  final String title;
  final int index;
  final bool isSelected;
  final VoidCallback onTap;
  final bool isVertical;

  const _NavigationItem({
    required this.title,
    required this.index,
    required this.isSelected,
    required this.onTap,
    required this.isVertical,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    if (isVertical) {
      return ListTile(
        title: Text(
          title,
          style: AppTheme.bodyLarge.copyWith(
            color: isSelected
                ? (isDark ? AppTheme.darkAccentColor : AppTheme.accentColor)
                : (isDark ? AppTheme.darkTextPrimary : AppTheme.textPrimary),
            fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
          ),
        ),
        selected: isSelected,
        selectedTileColor:
            (isDark ? AppTheme.darkAccentColor : AppTheme.accentColor)
                .withOpacity(0.1),
        onTap: () {
          onTap();
          Navigator.of(context).pop(); // Close drawer
        },
      );
    } else {
      return InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(8),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: isSelected
                ? (isDark ? AppTheme.darkAccentColor : AppTheme.accentColor)
                    .withOpacity(0.1)
                : Colors.transparent,
          ),
          child: Text(
            title,
            style: AppTheme.bodyMedium.copyWith(
              color: isSelected
                  ? (isDark ? AppTheme.darkAccentColor : AppTheme.accentColor)
                  : (isDark ? AppTheme.darkTextPrimary : AppTheme.textPrimary),
              fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
            ),
          ),
        ),
      );
    }
  }
}
