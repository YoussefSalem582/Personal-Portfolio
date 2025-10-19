import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/admin_controller.dart';
import '../../controllers/portfolio_controller.dart';
import '../../theme/app_theme.dart';
import '../../utils/responsive_helper.dart';

class AdminDashboardScreen extends StatefulWidget {
  const AdminDashboardScreen({super.key});

  @override
  State<AdminDashboardScreen> createState() => _AdminDashboardScreenState();
}

class _AdminDashboardScreenState extends State<AdminDashboardScreen> {
  int _selectedIndex = 0;

  final List<AdminNavItem> _navItems = [
    AdminNavItem(
      icon: Icons.dashboard,
      label: 'Dashboard',
      route: '/admin/dashboard',
    ),
    AdminNavItem(
      icon: Icons.work_outline,
      label: 'Projects',
      route: '/admin/projects',
    ),
    AdminNavItem(
      icon: Icons.card_membership,
      label: 'Certificates',
      route: '/admin/certificates',
    ),
    AdminNavItem(
      icon: Icons.star_outline,
      label: 'Skills',
      route: '/admin/skills',
    ),
    AdminNavItem(
      icon: Icons.person_outline,
      label: 'Personal Info',
      route: '/admin/personal-info',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = ResponsiveHelper.isMobile(screenWidth);
    final adminController = Get.find<AdminController>();
    final portfolioController = Get.find<PortfolioController>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Admin Dashboard'),
        actions: [
          // Sync button
          IconButton(
            icon: const Icon(Icons.refresh),
            tooltip: 'Refresh Data',
            onPressed: () => portfolioController.refreshAll(),
          ),
          // User menu
          Obx(() {
            final user = adminController.currentUser;
            return PopupMenuButton<String>(
              icon: CircleAvatar(
                backgroundColor: AppTheme.accentColor,
                child: Text(
                  user?.email?.substring(0, 1).toUpperCase() ?? 'A',
                  style: const TextStyle(color: Colors.white),
                ),
              ),
              itemBuilder: (context) => <PopupMenuEntry<String>>[
                PopupMenuItem<String>(
                  value: 'email',
                  enabled: false,
                  child: ListTile(
                    leading: const Icon(Icons.email),
                    title: Text(user?.email ?? 'Admin'),
                    contentPadding: EdgeInsets.zero,
                  ),
                ),
                const PopupMenuDivider(),
                const PopupMenuItem<String>(
                  value: 'profile',
                  child: ListTile(
                    leading: Icon(Icons.person),
                    title: Text('Profile'),
                    contentPadding: EdgeInsets.zero,
                  ),
                ),
                const PopupMenuItem<String>(
                  value: 'settings',
                  child: ListTile(
                    leading: Icon(Icons.settings),
                    title: Text('Settings'),
                    contentPadding: EdgeInsets.zero,
                  ),
                ),
                const PopupMenuDivider(),
                const PopupMenuItem<String>(
                  value: 'logout',
                  child: ListTile(
                    leading: Icon(Icons.logout, color: Colors.red),
                    title:
                        Text('Sign Out', style: TextStyle(color: Colors.red)),
                    contentPadding: EdgeInsets.zero,
                  ),
                ),
              ],
              onSelected: (value) {
                if (value == 'logout') {
                  adminController.signOut();
                }
                // TODO: Handle profile and settings
              },
            );
          }),
          const SizedBox(width: 8),
        ],
      ),
      drawer: isMobile ? _buildDrawer(context) : null,
      body: Row(
        children: [
          // Sidebar navigation (desktop only)
          if (!isMobile) _buildSidebar(context),

          // Main content
          Expanded(
            child: _buildContent(context),
          ),
        ],
      ),
    );
  }

  Widget _buildSidebar(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      width: 250,
      decoration: BoxDecoration(
        color: isDark ? AppTheme.darkCardColor : AppTheme.surfaceColor,
        border: Border(
          right: BorderSide(
            color: isDark
                ? AppTheme.darkTextSecondary.withValues(alpha: 0.2)
                : AppTheme.textSecondary.withValues(alpha: 0.2),
          ),
        ),
      ),
      child: ListView(
        padding: const EdgeInsets.symmetric(vertical: 16),
        children: _navItems.asMap().entries.map((entry) {
          final index = entry.key;
          final item = entry.value;
          final isSelected = _selectedIndex == index;

          return ListTile(
            leading: Icon(
              item.icon,
              color: isSelected
                  ? (isDark ? AppTheme.darkPrimaryColor : AppTheme.primaryColor)
                  : (isDark
                      ? AppTheme.darkTextSecondary
                      : AppTheme.textSecondary),
            ),
            title: Text(
              item.label,
              style: TextStyle(
                color: isSelected
                    ? (isDark
                        ? AppTheme.darkPrimaryColor
                        : AppTheme.primaryColor)
                    : (isDark
                        ? AppTheme.darkTextSecondary
                        : AppTheme.textSecondary),
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
              ),
            ),
            selected: isSelected,
            selectedTileColor: isDark
                ? AppTheme.darkPrimaryColor.withValues(alpha: 0.1)
                : AppTheme.primaryColor.withValues(alpha: 0.1),
            onTap: () {
              setState(() {
                _selectedIndex = index;
              });
              Get.toNamed(item.route);
            },
          );
        }).toList(),
      ),
    );
  }

  Widget _buildDrawer(BuildContext context) {
    return Drawer(
      child: _buildSidebar(context),
    );
  }

  Widget _buildContent(BuildContext context) {
    final portfolioController = Get.find<PortfolioController>();

    return Obx(() {
      if (portfolioController.isLoading) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }

      return SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Welcome header
            Text(
              'Welcome back!',
              style: AppTheme.headingMedium,
            ),
            const SizedBox(height: 8),
            Text(
              'Here\'s what\'s happening with your portfolio',
              style: AppTheme.bodyMedium,
            ),
            const SizedBox(height: 32),

            // Stats cards
            _buildStatsGrid(portfolioController),
            const SizedBox(height: 32),

            // Quick actions
            Text(
              'Quick Actions',
              style: AppTheme.headingSmall,
            ),
            const SizedBox(height: 16),
            _buildQuickActions(context),
            const SizedBox(height: 32),

            // Recent activity
            Text(
              'Recent Projects',
              style: AppTheme.headingSmall,
            ),
            const SizedBox(height: 16),
            _buildRecentProjects(portfolioController),
          ],
        ),
      );
    });
  }

  Widget _buildStatsGrid(PortfolioController controller) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final crossAxisCount = constraints.maxWidth > 900
            ? 4
            : constraints.maxWidth > 600
                ? 2
                : 1;

        return GridView.count(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisCount: crossAxisCount,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          childAspectRatio: 1.5,
          children: [
            _buildStatCard(
              icon: Icons.work,
              label: 'Projects',
              value: controller.projects.length.toString(),
              color: Colors.blue,
            ),
            _buildStatCard(
              icon: Icons.card_membership,
              label: 'Certificates',
              value: controller.certificates.length.toString(),
              color: Colors.green,
            ),
            _buildStatCard(
              icon: Icons.star,
              label: 'Skills',
              value: controller.skillCategories
                  .fold(0, (sum, cat) => sum + cat.skills.length)
                  .toString(),
              color: Colors.orange,
            ),
            _buildStatCard(
              icon: Icons.category,
              label: 'Categories',
              value: controller.skillCategories.length.toString(),
              color: Colors.purple,
            ),
          ],
        );
      },
    );
  }

  Widget _buildStatCard({
    required IconData icon,
    required String label,
    required String value,
    required Color color,
  }) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 36, color: color),
            const SizedBox(height: 12),
            Text(
              value,
              style: AppTheme.headingLarge.copyWith(fontSize: 32),
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: AppTheme.bodyMedium,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildQuickActions(BuildContext context) {
    return Wrap(
      spacing: 16,
      runSpacing: 16,
      children: [
        _buildActionButton(
          icon: Icons.add,
          label: 'Add Project',
          onTap: () => Get.toNamed('/admin/projects/new'),
        ),
        _buildActionButton(
          icon: Icons.upload,
          label: 'Upload Certificate',
          onTap: () => Get.toNamed('/admin/certificates/new'),
        ),
        _buildActionButton(
          icon: Icons.edit,
          label: 'Edit Skills',
          onTap: () => Get.toNamed('/admin/skills'),
        ),
        _buildActionButton(
          icon: Icons.person,
          label: 'Update Info',
          onTap: () => Get.toNamed('/admin/personal-info'),
        ),
      ],
    );
  }

  Widget _buildActionButton({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return ElevatedButton.icon(
      onPressed: onTap,
      icon: Icon(icon),
      label: Text(label),
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      ),
    );
  }

  Widget _buildRecentProjects(PortfolioController controller) {
    final recentProjects = controller.projects.take(3).toList();

    if (recentProjects.isEmpty) {
      return Card(
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: Center(
            child: Column(
              children: [
                Icon(
                  Icons.work_off,
                  size: 64,
                  color: AppTheme.textSecondary.withValues(alpha: 0.5),
                ),
                const SizedBox(height: 16),
                Text(
                  'No projects yet',
                  style: AppTheme.bodyLarge,
                ),
                const SizedBox(height: 16),
                ElevatedButton.icon(
                  onPressed: () => Get.toNamed('/admin/projects/new'),
                  icon: const Icon(Icons.add),
                  label: const Text('Add Your First Project'),
                ),
              ],
            ),
          ),
        ),
      );
    }

    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: recentProjects.length,
      itemBuilder: (context, index) {
        final project = recentProjects[index];
        return Card(
          margin: const EdgeInsets.only(bottom: 12),
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: AppTheme.accentColor,
              child: const Icon(Icons.work, color: Colors.white),
            ),
            title: Text(project.title),
            subtitle: Text(
              project.shortDescription,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            trailing: IconButton(
              icon: const Icon(Icons.edit),
              onPressed: () => Get.toNamed(
                '/admin/projects/edit',
                arguments: project,
              ),
            ),
          ),
        );
      },
    );
  }
}

class AdminNavItem {
  final IconData icon;
  final String label;
  final String route;

  AdminNavItem({
    required this.icon,
    required this.label,
    required this.route,
  });
}
