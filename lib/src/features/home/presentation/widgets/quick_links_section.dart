import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/routing/app_router.dart';
import '../../../../shared/widgets/responsive_layout.dart';

/// Quick links section for easy navigation
class QuickLinksSection extends StatelessWidget {
  const QuickLinksSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Quick Links',
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        const SizedBox(height: 24),
        ResponsiveLayout(
          mobile: _buildMobileLayout(context),
          tablet: _buildGridLayout(context, 2),
          desktop: _buildGridLayout(context, 4),
        ),
      ],
    );
  }

  Widget _buildMobileLayout(BuildContext context) {
    return Column(
      children: [
        _QuickLinkCard(
          icon: Icons.person,
          title: 'About Me',
          description: 'Learn about my background and skills',
          onTap: () => context.go(AppRoutes.about),
        ),
        const SizedBox(height: 16),
        _QuickLinkCard(
          icon: Icons.work,
          title: 'Projects',
          description: 'Explore my portfolio of work',
          onTap: () => context.go(AppRoutes.projects),
        ),
        const SizedBox(height: 16),
        _QuickLinkCard(
          icon: Icons.timeline,
          title: 'Experience',
          description: 'View my professional journey',
          onTap: () => context.go(AppRoutes.experience),
        ),
        const SizedBox(height: 16),
        _QuickLinkCard(
          icon: Icons.contact_mail,
          title: 'Contact',
          description: 'Get in touch with me',
          onTap: () => context.go(AppRoutes.contact),
        ),
      ],
    );
  }

  Widget _buildGridLayout(BuildContext context, int crossAxisCount) {
    return GridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: crossAxisCount,
      crossAxisSpacing: 16,
      mainAxisSpacing: 16,
      childAspectRatio: 1.2,
      children: [
        _QuickLinkCard(
          icon: Icons.person,
          title: 'About Me',
          description: 'Learn about my background and skills',
          onTap: () => context.go(AppRoutes.about),
        ),
        _QuickLinkCard(
          icon: Icons.work,
          title: 'Projects',
          description: 'Explore my portfolio of work',
          onTap: () => context.go(AppRoutes.projects),
        ),
        _QuickLinkCard(
          icon: Icons.timeline,
          title: 'Experience',
          description: 'View my professional journey',
          onTap: () => context.go(AppRoutes.experience),
        ),
        _QuickLinkCard(
          icon: Icons.contact_mail,
          title: 'Contact',
          description: 'Get in touch with me',
          onTap: () => context.go(AppRoutes.contact),
        ),
      ],
    );
  }
}

/// Individual quick link card widget
class _QuickLinkCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;
  final VoidCallback onTap;

  const _QuickLinkCard({
    required this.icon,
    required this.title,
    required this.description,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor.withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  icon,
                  size: 32,
                  color: Theme.of(context).primaryColor,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                title,
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              Text(
                description,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Theme.of(context)
                          .colorScheme
                          .onSurface
                          .withOpacity(0.7),
                    ),
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
