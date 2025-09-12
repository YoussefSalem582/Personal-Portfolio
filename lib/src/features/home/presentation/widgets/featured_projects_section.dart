import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/routing/app_router.dart';
import '../../../../shared/widgets/responsive_layout.dart';

/// Featured projects section for the home page
class FeaturedProjectsSection extends StatelessWidget {
  const FeaturedProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Featured Projects',
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            TextButton(
              onPressed: () => context.go(AppRoutes.projects),
              child: const Text('View All'),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Text(
          'Some of my recent work',
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color:
                    Theme.of(context).colorScheme.onBackground.withOpacity(0.7),
              ),
        ),
        const SizedBox(height: 32),
        ResponsiveLayout(
          mobile: _buildMobileLayout(context),
          tablet: _buildTabletLayout(context),
          desktop: _buildDesktopLayout(context),
        ),
      ],
    );
  }

  Widget _buildMobileLayout(BuildContext context) {
    return Column(
      children: [
        _FeaturedProjectCard(
          title: 'Multi-Emotion Recognition',
          description:
              'AI-powered customer service application that analyzes emotions in real-time during customer interactions.',
          technologies: ['Flutter', 'TensorFlow', 'Python', 'OpenCV'],
          onTap: () =>
              context.go(AppRoutes.projectDetail('multi-emotion-recognition')),
        ),
        const SizedBox(height: 16),
        _FeaturedProjectCard(
          title: 'Music Player App',
          description:
              'Feature-rich music player application with advanced audio controls and playlist management.',
          technologies: ['Flutter', 'Dart', 'SQLite', 'Audio Service'],
          onTap: () => context.go(AppRoutes.projectDetail('music-player-app')),
        ),
        const SizedBox(height: 16),
        _FeaturedProjectCard(
          title: 'ChargeHub App',
          description:
              'Electric vehicle charging station locator with real-time availability and booking system.',
          technologies: ['Flutter', 'Google Maps API', 'Firebase', 'GPS'],
          onTap: () => context.go(AppRoutes.projectDetail('chargehub-app')),
        ),
      ],
    );
  }

  Widget _buildTabletLayout(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: _FeaturedProjectCard(
                title: 'Multi-Emotion Recognition',
                description:
                    'AI-powered customer service application that analyzes emotions in real-time.',
                technologies: ['Flutter', 'TensorFlow', 'Python'],
                onTap: () => context
                    .go(AppRoutes.projectDetail('multi-emotion-recognition')),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: _FeaturedProjectCard(
                title: 'Music Player App',
                description:
                    'Feature-rich music player with advanced audio controls.',
                technologies: ['Flutter', 'Dart', 'SQLite'],
                onTap: () =>
                    context.go(AppRoutes.projectDetail('music-player-app')),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        _FeaturedProjectCard(
          title: 'ChargeHub App',
          description:
              'EV charging station locator with real-time availability and booking system.',
          technologies: ['Flutter', 'Google Maps API', 'Firebase', 'GPS'],
          onTap: () => context.go(AppRoutes.projectDetail('chargehub-app')),
        ),
      ],
    );
  }

  Widget _buildDesktopLayout(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: _FeaturedProjectCard(
            title: 'Multi-Emotion Recognition',
            description:
                'AI-powered customer service application that analyzes emotions in real-time during customer interactions.',
            technologies: ['Flutter', 'TensorFlow', 'Python', 'OpenCV'],
            onTap: () => context
                .go(AppRoutes.projectDetail('multi-emotion-recognition')),
          ),
        ),
        const SizedBox(width: 24),
        Expanded(
          child: _FeaturedProjectCard(
            title: 'Music Player App',
            description:
                'Feature-rich music player application with advanced audio controls and playlist management.',
            technologies: ['Flutter', 'Dart', 'SQLite', 'Audio Service'],
            onTap: () =>
                context.go(AppRoutes.projectDetail('music-player-app')),
          ),
        ),
        const SizedBox(width: 24),
        Expanded(
          child: _FeaturedProjectCard(
            title: 'ChargeHub App',
            description:
                'Electric vehicle charging station locator with real-time availability and booking system.',
            technologies: ['Flutter', 'Google Maps API', 'Firebase', 'GPS'],
            onTap: () => context.go(AppRoutes.projectDetail('chargehub-app')),
          ),
        ),
      ],
    );
  }
}

/// Individual featured project card widget
class _FeaturedProjectCard extends StatelessWidget {
  final String title;
  final String description;
  final List<String> technologies;
  final VoidCallback onTap;

  const _FeaturedProjectCard({
    required this.title,
    required this.description,
    required this.technologies,
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Project image placeholder
              Container(
                height: 180,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(
                  Icons.image,
                  size: 48,
                  color: Theme.of(context).primaryColor.withOpacity(0.5),
                ),
              ),
              const SizedBox(height: 16),
              Text(
                title,
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 8),
              Text(
                description,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Theme.of(context)
                          .colorScheme
                          .onSurface
                          .withOpacity(0.7),
                      height: 1.4,
                    ),
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 16),
              Wrap(
                spacing: 6,
                runSpacing: 6,
                children: technologies
                    .take(3) // Show only first 3 technologies
                    .map(
                      (tech) => Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color:
                              Theme.of(context).primaryColor.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          tech,
                          style:
                              Theme.of(context).textTheme.bodySmall?.copyWith(
                                    color: Theme.of(context).primaryColor,
                                    fontWeight: FontWeight.w500,
                                  ),
                        ),
                      ),
                    )
                    .toList(),
              ),
              if (technologies.length > 3) ...[
                const SizedBox(height: 8),
                Text(
                  '+${technologies.length - 3} more',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Theme.of(context)
                            .colorScheme
                            .onSurface
                            .withOpacity(0.6),
                      ),
                ),
              ],
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: onTap,
                    child: const Text('Learn More'),
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 16,
                    color: Theme.of(context).primaryColor,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
