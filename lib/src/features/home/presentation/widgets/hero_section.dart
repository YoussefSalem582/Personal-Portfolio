import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../shared/widgets/responsive_layout.dart';

/// Hero section for the home page
class HeroSection extends ConsumerWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      width: double.infinity,
      padding: ResponsiveLayout.isDesktop(context)
          ? const EdgeInsets.symmetric(horizontal: 64, vertical: 80)
          : ResponsiveLayout.isTablet(context)
              ? const EdgeInsets.symmetric(horizontal: 32, vertical: 60)
              : const EdgeInsets.symmetric(horizontal: 16, vertical: 40),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Theme.of(context).primaryColor.withOpacity(0.1),
            Theme.of(context).primaryColor.withOpacity(0.05),
          ],
        ),
      ),
      child: ResponsiveLayout(
        mobile: _buildMobileLayout(context),
        tablet: _buildTabletLayout(context),
        desktop: _buildDesktopLayout(context),
      ),
    );
  }

  Widget _buildMobileLayout(BuildContext context) {
    return Column(
      children: [
        _buildProfileImage(context, 120),
        const SizedBox(height: 24),
        _buildTextContent(context),
        const SizedBox(height: 32),
        _buildActionButtons(context, isVertical: true),
      ],
    );
  }

  Widget _buildTabletLayout(BuildContext context) {
    return Column(
      children: [
        _buildProfileImage(context, 150),
        const SizedBox(height: 32),
        _buildTextContent(context),
        const SizedBox(height: 40),
        _buildActionButtons(context, isVertical: false),
      ],
    );
  }

  Widget _buildDesktopLayout(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 3,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildTextContent(context, isDesktop: true),
              const SizedBox(height: 40),
              _buildActionButtons(context, isVertical: false),
            ],
          ),
        ),
        const SizedBox(width: 64),
        Expanded(
          flex: 2,
          child: Center(
            child: _buildProfileImage(context, 200),
          ),
        ),
      ],
    );
  }

  Widget _buildProfileImage(BuildContext context, double size) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: Theme.of(context).primaryColor,
          width: 4,
        ),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).primaryColor.withOpacity(0.3),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: ClipOval(
        child: Image.asset(
          'assets/images/profile.jpg',
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) {
            return Container(
              color: Theme.of(context).primaryColor.withOpacity(0.1),
              child: Icon(
                Icons.person,
                size: size * 0.6,
                color: Theme.of(context).primaryColor,
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildTextContent(BuildContext context, {bool isDesktop = false}) {
    return Column(
      crossAxisAlignment:
          isDesktop ? CrossAxisAlignment.start : CrossAxisAlignment.center,
      children: [
        Text(
          'Hello, I\'m',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                color: Theme.of(context).primaryColor,
                fontWeight: FontWeight.w500,
              ),
          textAlign: isDesktop ? TextAlign.start : TextAlign.center,
        ),
        const SizedBox(height: 8),
        Text(
          'Youssef Salem Hassan',
          style: Theme.of(context).textTheme.displaySmall?.copyWith(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.onBackground,
              ),
          textAlign: isDesktop ? TextAlign.start : TextAlign.center,
        ),
        const SizedBox(height: 12),
        Text(
          'Flutter Developer & Mobile App Specialist',
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                color:
                    Theme.of(context).colorScheme.onBackground.withOpacity(0.8),
                fontWeight: FontWeight.w500,
              ),
          textAlign: isDesktop ? TextAlign.start : TextAlign.center,
        ),
        const SizedBox(height: 16),
        Container(
          constraints: const BoxConstraints(maxWidth: 600),
          child: Text(
            'Passionate Flutter developer with expertise in cross-platform mobile app development, machine learning integration, and full-stack solutions. I specialize in creating scalable applications with modern UI/UX design principles.',
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  height: 1.6,
                  color: Theme.of(context)
                      .colorScheme
                      .onBackground
                      .withOpacity(0.7),
                ),
            textAlign: isDesktop ? TextAlign.start : TextAlign.center,
          ),
        ),
      ],
    );
  }

  Widget _buildActionButtons(BuildContext context, {required bool isVertical}) {
    final buttons = [
      ElevatedButton.icon(
        onPressed: () {
          // Navigate to projects
        },
        icon: const Icon(Icons.work),
        label: const Text('View My Work'),
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        ),
      ),
      OutlinedButton.icon(
        onPressed: () {
          // Navigate to contact
        },
        icon: const Icon(Icons.mail),
        label: const Text('Get In Touch'),
        style: OutlinedButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        ),
      ),
    ];

    if (isVertical) {
      return Column(
        children: [
          buttons[0],
          const SizedBox(height: 12),
          buttons[1],
        ],
      );
    } else {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          buttons[0],
          const SizedBox(width: 16),
          buttons[1],
        ],
      );
    }
  }
}
