import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../theme/app_theme.dart';
import '../widgets/app_navigation.dart';
import '../utils/responsive_helper.dart';
import '../controllers/portfolio_controller.dart';
import 'sections/hero_section.dart';
import 'sections/about_section.dart';
import 'sections/projects_section.dart';
import 'sections/skills_section.dart';
import 'sections/certificates_section.dart';
import 'sections/contact_section.dart';
import '../widgets/footer.dart';
import '../widgets/privacy_consent_banner.dart';

class PortfolioScreen extends StatefulWidget {
  const PortfolioScreen({super.key});

  @override
  State<PortfolioScreen> createState() => _PortfolioScreenState();
}

class _PortfolioScreenState extends State<PortfolioScreen> {
  final ScrollController _scrollController = ScrollController();
  final List<GlobalKey> _sectionKeys = List.generate(6, (index) => GlobalKey());
  int _currentSection = 0;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    for (int i = 0; i < _sectionKeys.length; i++) {
      final context = _sectionKeys[i].currentContext;
      if (context != null) {
        final box = context.findRenderObject() as RenderBox;
        final position = box.localToGlobal(Offset.zero);

        if (position.dy <= 100 && position.dy > -box.size.height + 100) {
          if (_currentSection != i) {
            setState(() {
              _currentSection = i;
            });
          }
          break;
        }
      }
    }
  }

  void _scrollToSection(int index) {
    final context = _sectionKeys[index].currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 800),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = ResponsiveHelper.isMobile(screenWidth);
    final controller = Get.find<PortfolioController>();

    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      drawer: isMobile
          ? AppNavigation(
              onItemSelected: _scrollToSection,
              currentIndex: _currentSection,
            ).buildMobileDrawer(context)
          : null,
      body: Obx(() {
        // Show loading state
        if (controller.isLoading) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const CircularProgressIndicator(),
                const SizedBox(height: AppTheme.spacingL),
                Text(
                  'Loading portfolio...',
                  style: AppTheme.bodyLarge,
                ),
              ],
            ),
          );
        }

        // Show error state
        if (controller.error != null) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.error_outline,
                  size: 64,
                  color: AppTheme.errorColor,
                ),
                const SizedBox(height: AppTheme.spacingL),
                Text(
                  'Error loading portfolio',
                  style: AppTheme.headingMedium,
                ),
                const SizedBox(height: AppTheme.spacingM),
                Text(
                  controller.error!,
                  style: AppTheme.bodyMedium.copyWith(
                    color: AppTheme.textSecondary,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: AppTheme.spacingL),
                ElevatedButton.icon(
                  onPressed: () => controller.refresh(),
                  icon: const Icon(Icons.refresh),
                  label: const Text('Retry'),
                ),
              ],
            ),
          );
        }

        // Show main content
        return Stack(
          children: [
            Column(
              children: [
                // Navigation
                AppNavigation(
                  onItemSelected: _scrollToSection,
                  currentIndex: _currentSection,
                ),

                // Content
                Expanded(
                  child: SingleChildScrollView(
                    controller: _scrollController,
                    child: Column(
                      children: [
                        // Hero Section
                        HeroSection(key: _sectionKeys[0]),

                        // About Section
                        AboutSection(key: _sectionKeys[1]),

                        // Projects Section
                        ProjectsSection(key: _sectionKeys[2]),

                        // Skills Section
                        SkillsSection(key: _sectionKeys[3]),

                        // Certificates Section
                        CertificatesSection(key: _sectionKeys[4]),

                        // Contact Section
                        ContactSection(key: _sectionKeys[5]),

                        // Footer
                        const Footer(),
                      ],
                    ),
                  ),
                ),
              ],
            ),

            // Privacy Consent Banner
            const PrivacyConsentBanner(),
          ],
        );
      }),

      // Floating Action Button for mobile
      floatingActionButton: isMobile
          ? FloatingActionButton(
              onPressed: () => _scrollToSection(5), // Go to contact
              backgroundColor: AppTheme.accentColor,
              child: const Icon(Icons.message, color: AppTheme.surfaceColor),
            )
          : null,
    );
  }
}
