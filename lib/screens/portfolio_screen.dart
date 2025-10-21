import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../theme/app_theme.dart';
import '../widgets/navigation/app_navigation.dart';
import '../utils/responsive_helper.dart';
import '../controllers/portfolio_controller.dart';
import 'sections/hero_section.dart';
import 'sections/about_section.dart';
import 'sections/projects_section.dart';
import 'sections/skills_section.dart';
import 'sections/certificates_section.dart';
import 'sections/contact_section.dart';
import '../widgets/footer.dart';
import '../widgets/skeleton_loading.dart';

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
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final isMobile = ResponsiveHelper.isMobile(screenWidth);

    // Calculate positions based on device type
    final List<double> positions;

    if (isMobile) {
      // Mobile scroll positions (adjusted for mobile layout)
      positions = [
        0.0, // Home
        screenHeight * 1.42, // About
        screenHeight * 3.2, // Projects
        screenHeight * 9.4, // Skills
        screenHeight * 10.4, // Certificates
        screenHeight * 11.5, // Contact
      ];
    } else {
      // Desktop scroll positions
      positions = [
        0.0, // Home
        screenHeight * 0.9, // About
        screenHeight * 2.1, // Projects
        screenHeight * 5.35, // Skills
        screenHeight * 5.85, // Certificates
        screenHeight * 8.3, // Contact
      ];
    }

    if (index < positions.length) {
      _scrollController.animateTo(
        positions[index],
        duration: const Duration(milliseconds: 600),
        curve: Curves.easeInOutCubic,
      );

      // Update current section
      setState(() {
        _currentSection = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = ResponsiveHelper.isMobile(screenWidth);
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final controller = Get.find<PortfolioController>();

    return Scaffold(
      backgroundColor:
          isDark ? AppTheme.darkBackgroundColor : AppTheme.backgroundColor,
      drawer: isMobile
          ? AppNavigation.buildDrawer(
              context, _scrollToSection, _currentSection)
          : null,
      body: Obx(() {
        // Show loading state
        if (controller.isLoading) {
          return const SkeletonLoading();
        }

        // Show main content with optimized Slivers for better performance
        return Column(
          children: [
            // Fixed Navigation Bar
            AppNavigation(
              onItemSelected: _scrollToSection,
              currentIndex: _currentSection,
            ),

            // Scrollable Content - Removed lazy loading for better performance
            Expanded(
              child: CustomScrollView(
                controller: _scrollController,
                physics: const BouncingScrollPhysics(
                  parent: AlwaysScrollableScrollPhysics(),
                ),
                cacheExtent: 1000, // Increased cache for smoother scrolling
                slivers: [
                  // Hero Section
                  SliverToBoxAdapter(
                    child: HeroSection(key: _sectionKeys[0]),
                  ),

                  // About Section
                  SliverToBoxAdapter(
                    child: AboutSection(key: _sectionKeys[1]),
                  ),

                  // Projects Section
                  SliverToBoxAdapter(
                    child: ProjectsSection(key: _sectionKeys[2]),
                  ),

                  // Skills Section
                  SliverToBoxAdapter(
                    child: SkillsSection(key: _sectionKeys[3]),
                  ),

                  // Certificates Section
                  SliverToBoxAdapter(
                    child: CertificatesSection(key: _sectionKeys[4]),
                  ),

                  // Contact Section
                  SliverToBoxAdapter(
                    child: ContactSection(key: _sectionKeys[5]),
                  ),

                  // Footer - Always load
                  const SliverToBoxAdapter(
                    child: Footer(),
                  ),
                ],
              ),
            ),
          ],
        );
      }),

      // Floating Action Button for mobile
      floatingActionButton: isMobile
          ? FloatingActionButton(
              onPressed: () => _scrollToSection(5), // Go to contact
              backgroundColor:
                  isDark ? AppTheme.darkAccentColor : AppTheme.accentColor,
              child: Icon(
                Icons.message,
                color:
                    isDark ? AppTheme.darkTextPrimary : AppTheme.surfaceColor,
              ),
            )
          : null,
    );
  }
}
