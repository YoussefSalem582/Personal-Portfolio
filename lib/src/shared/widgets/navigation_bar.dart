import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../core/routing/app_router.dart';

/// Bottom navigation bar for mobile devices
class AppBottomNavigationBar extends StatelessWidget {
  const AppBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    final currentLocation = GoRouterState.of(context).uri.path;

    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: _getCurrentIndex(currentLocation),
      onTap: (index) => _onItemTapped(context, index),
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'About',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.work),
          label: 'Projects',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.timeline),
          label: 'Experience',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.contact_mail),
          label: 'Contact',
        ),
      ],
    );
  }

  int _getCurrentIndex(String location) {
    if (location.startsWith('/about')) return 1;
    if (location.startsWith('/projects')) return 2;
    if (location.startsWith('/experience')) return 3;
    if (location.startsWith('/contact')) return 4;
    return 0; // Home
  }

  void _onItemTapped(BuildContext context, int index) {
    switch (index) {
      case 0:
        context.go(AppRoutes.home);
        break;
      case 1:
        context.go(AppRoutes.about);
        break;
      case 2:
        context.go(AppRoutes.projects);
        break;
      case 3:
        context.go(AppRoutes.experience);
        break;
      case 4:
        context.go(AppRoutes.contact);
        break;
    }
  }
}

/// Navigation drawer for tablet devices
class AppNavigationDrawer extends StatelessWidget {
  const AppNavigationDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final currentLocation = GoRouterState.of(context).uri.path;

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage('assets/images/profile.jpg'),
                  child: Icon(Icons.person, size: 30),
                ),
                const SizedBox(height: 8),
                Text(
                  'Youssef Salem Hassan',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: Colors.white,
                      ),
                ),
                Text(
                  'Flutter Developer',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Colors.white70,
                      ),
                ),
              ],
            ),
          ),
          _DrawerItem(
            icon: Icons.home,
            title: 'Home',
            isSelected: currentLocation == AppRoutes.home,
            onTap: () {
              Navigator.pop(context);
              context.go(AppRoutes.home);
            },
          ),
          _DrawerItem(
            icon: Icons.person,
            title: 'About',
            isSelected: currentLocation.startsWith('/about'),
            onTap: () {
              Navigator.pop(context);
              context.go(AppRoutes.about);
            },
          ),
          _DrawerItem(
            icon: Icons.work,
            title: 'Projects',
            isSelected: currentLocation.startsWith('/projects'),
            onTap: () {
              Navigator.pop(context);
              context.go(AppRoutes.projects);
            },
          ),
          _DrawerItem(
            icon: Icons.timeline,
            title: 'Experience',
            isSelected: currentLocation.startsWith('/experience'),
            onTap: () {
              Navigator.pop(context);
              context.go(AppRoutes.experience);
            },
          ),
          _DrawerItem(
            icon: Icons.article,
            title: 'Blog',
            isSelected: currentLocation.startsWith('/blog'),
            onTap: () {
              Navigator.pop(context);
              context.go(AppRoutes.blog);
            },
          ),
          _DrawerItem(
            icon: Icons.contact_mail,
            title: 'Contact',
            isSelected: currentLocation.startsWith('/contact'),
            onTap: () {
              Navigator.pop(context);
              context.go(AppRoutes.contact);
            },
          ),
          const Divider(),
          ListTile(
            leading: const FaIcon(FontAwesomeIcons.github),
            title: const Text('GitHub'),
            onTap: () {
              // Open GitHub profile
            },
          ),
          ListTile(
            leading: const FaIcon(FontAwesomeIcons.linkedin),
            title: const Text('LinkedIn'),
            onTap: () {
              // Open LinkedIn profile
            },
          ),
        ],
      ),
    );
  }
}

/// Navigation rail for desktop devices
class AppNavigationRail extends StatelessWidget {
  const AppNavigationRail({super.key});

  @override
  Widget build(BuildContext context) {
    final currentLocation = GoRouterState.of(context).uri.path;

    return NavigationRail(
      selectedIndex: _getCurrentIndex(currentLocation),
      onDestinationSelected: (index) => _onDestinationSelected(context, index),
      labelType: NavigationRailLabelType.all,
      leading: Column(
        children: [
          const SizedBox(height: 16),
          const CircleAvatar(
            radius: 24,
            backgroundImage: AssetImage('assets/images/profile.jpg'),
            child: Icon(Icons.person, size: 24),
          ),
          const SizedBox(height: 16),
        ],
      ),
      destinations: const [
        NavigationRailDestination(
          icon: Icon(Icons.home),
          label: Text('Home'),
        ),
        NavigationRailDestination(
          icon: Icon(Icons.person),
          label: Text('About'),
        ),
        NavigationRailDestination(
          icon: Icon(Icons.work),
          label: Text('Projects'),
        ),
        NavigationRailDestination(
          icon: Icon(Icons.timeline),
          label: Text('Experience'),
        ),
        NavigationRailDestination(
          icon: Icon(Icons.article),
          label: Text('Blog'),
        ),
        NavigationRailDestination(
          icon: Icon(Icons.contact_mail),
          label: Text('Contact'),
        ),
      ],
    );
  }

  int _getCurrentIndex(String location) {
    if (location.startsWith('/about')) return 1;
    if (location.startsWith('/projects')) return 2;
    if (location.startsWith('/experience')) return 3;
    if (location.startsWith('/blog')) return 4;
    if (location.startsWith('/contact')) return 5;
    return 0; // Home
  }

  void _onDestinationSelected(BuildContext context, int index) {
    switch (index) {
      case 0:
        context.go(AppRoutes.home);
        break;
      case 1:
        context.go(AppRoutes.about);
        break;
      case 2:
        context.go(AppRoutes.projects);
        break;
      case 3:
        context.go(AppRoutes.experience);
        break;
      case 4:
        context.go(AppRoutes.blog);
        break;
      case 5:
        context.go(AppRoutes.contact);
        break;
    }
  }
}

/// Custom drawer item widget
class _DrawerItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final bool isSelected;
  final VoidCallback onTap;

  const _DrawerItem({
    required this.icon,
    required this.title,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        icon,
        color: isSelected ? Theme.of(context).primaryColor : null,
      ),
      title: Text(
        title,
        style: TextStyle(
          color: isSelected ? Theme.of(context).primaryColor : null,
          fontWeight: isSelected ? FontWeight.w600 : null,
        ),
      ),
      selected: isSelected,
      selectedTileColor: Theme.of(context).primaryColor.withOpacity(0.1),
      onTap: onTap,
    );
  }
}
