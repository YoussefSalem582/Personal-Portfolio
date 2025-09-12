import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../../shared/widgets/responsive_layout.dart';
import '../../../../core/routing/app_router.dart';
import '../widgets/hero_section.dart';
import '../widgets/quick_links_section.dart';
import '../widgets/featured_projects_section.dart';
import '../widgets/skills_overview_section.dart';

/// Home page of the portfolio application
class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SingleChildScrollView(
      child: Column(
        children: [
          // Hero Section
          const HeroSection(),

          // Quick Links Section
          ResponsivePadding(
            mobile: const EdgeInsets.all(16),
            tablet: const EdgeInsets.all(24),
            desktop: const EdgeInsets.all(32),
            child: const QuickLinksSection(),
          ),

          // Skills Overview Section
          ResponsivePadding(
            mobile: const EdgeInsets.all(16),
            tablet: const EdgeInsets.all(24),
            desktop: const EdgeInsets.all(32),
            child: const SkillsOverviewSection(),
          ),

          // Featured Projects Section
          ResponsivePadding(
            mobile: const EdgeInsets.all(16),
            tablet: const EdgeInsets.all(24),
            desktop: const EdgeInsets.all(32),
            child: const FeaturedProjectsSection(),
          ),

          // Call to Action Section
          _CallToActionSection(),

          const SizedBox(height: 32),
        ],
      ),
    );
  }
}

/// Call to action section
class _CallToActionSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Theme.of(context).primaryColor,
            Theme.of(context).primaryColor.withOpacity(0.8),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Text(
            'Ready to Start Your Next Project?',
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          Text(
            'Let\'s work together to build something amazing. I\'m always excited to take on new challenges and bring ideas to life.',
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: Colors.white70,
                ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),
          ResponsiveLayout(
            mobile: Column(
              children: [
                _buildContactButton(context),
                const SizedBox(height: 12),
                _buildPortfolioButton(context),
              ],
            ),
            tablet: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildContactButton(context),
                const SizedBox(width: 16),
                _buildPortfolioButton(context),
              ],
            ),
            desktop: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildContactButton(context),
                const SizedBox(width: 16),
                _buildPortfolioButton(context),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContactButton(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () => context.go(AppRoutes.contact),
      icon: const Icon(Icons.mail),
      label: const Text('Get In Touch'),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        foregroundColor: Theme.of(context).primaryColor,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      ),
    );
  }

  Widget _buildPortfolioButton(BuildContext context) {
    return OutlinedButton.icon(
      onPressed: () => context.go(AppRoutes.projects),
      icon: const Icon(Icons.work),
      label: const Text('View Portfolio'),
      style: OutlinedButton.styleFrom(
        foregroundColor: Colors.white,
        side: const BorderSide(color: Colors.white),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      ),
    );
  }
}
