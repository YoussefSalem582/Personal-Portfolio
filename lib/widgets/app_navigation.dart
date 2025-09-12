import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../utils/responsive_helper.dart';

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
    return Container(
      height: 80,
      padding: EdgeInsets.symmetric(
        horizontal: ResponsiveHelper.getHorizontalPadding(
          MediaQuery.of(context).size.width,
        ),
      ),
      decoration: const BoxDecoration(
        color: AppTheme.surfaceColor,
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 4, offset: Offset(0, 2)),
        ],
      ),
      child: Row(
        children: [
          // Logo/Name
          Text(
            'Youssef Salem',
            style: AppTheme.headingSmall.copyWith(
              color: AppTheme.primaryColor,
              fontWeight: FontWeight.bold,
            ),
          ),

          const Spacer(),

          // Navigation items
          Row(children: _buildNavigationItems(false)),
        ],
      ),
    );
  }

  Widget _buildMobileNavigation(BuildContext context) {
    return AppBar(
      backgroundColor: AppTheme.surfaceColor,
      elevation: 2,
      shadowColor: Colors.black12,
      leading: Builder(
        builder: (context) => IconButton(
          icon: const Icon(Icons.menu, color: AppTheme.primaryColor),
          onPressed: () => Scaffold.of(context).openDrawer(),
        ),
      ),
      title: Text(
        'Youssef Salem',
        style: AppTheme.headingSmall.copyWith(
          color: AppTheme.primaryColor,
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
        title: 'Contact',
        index: 4,
        isSelected: currentIndex == 4,
        onTap: () => onItemSelected(4),
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
    return Drawer(
      child: Container(
        color: AppTheme.surfaceColor,
        child: Column(
          children: [
            // Header
            Container(
              height: 120,
              width: double.infinity,
              decoration: const BoxDecoration(
                gradient: AppTheme.primaryGradient,
              ),
              child: Center(
                child: Text(
                  'Youssef Salem Hassan',
                  style: AppTheme.headingSmall.copyWith(
                    color: AppTheme.surfaceColor,
                  ),
                ),
              ),
            ),

            // Navigation items
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(vertical: 16),
                children: _buildNavigationItems(true),
              ),
            ),
          ],
        ),
      ),
    );
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
    if (isVertical) {
      return ListTile(
        title: Text(
          title,
          style: AppTheme.bodyLarge.copyWith(
            color: isSelected ? AppTheme.accentColor : AppTheme.textPrimary,
            fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
          ),
        ),
        selected: isSelected,
        selectedTileColor: AppTheme.accentColor.withOpacity(0.1),
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
                ? AppTheme.accentColor.withOpacity(0.1)
                : Colors.transparent,
          ),
          child: Text(
            title,
            style: AppTheme.bodyMedium.copyWith(
              color: isSelected ? AppTheme.accentColor : AppTheme.textPrimary,
              fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
            ),
          ),
        ),
      );
    }
  }
}
