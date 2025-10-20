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
import '../widgets/skeleton_loading.dart';
import '../widgets/lazy_load_widget.dart';

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
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final controller = Get.find<PortfolioController>();

    return Scaffold(
      backgroundColor:
          isDark ? AppTheme.darkBackgroundColor : AppTheme.backgroundColor,
      drawer: isMobile
          ? AppNavigation(
              onItemSelected: _scrollToSection,
              currentIndex: _currentSection,
            ).buildMobileDrawer(context)
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

            // Scrollable Content with Optimized Slivers
            Expanded(
              child: CustomScrollView(
                controller: _scrollController,
                physics: const BouncingScrollPhysics(
                  parent: AlwaysScrollableScrollPhysics(),
                ),
                cacheExtent:
                    1000, // Cache 1000 pixels ahead for smooth scrolling
                slivers: [
                  // Hero Section - Always visible, no lazy loading
                  SliverToBoxAdapter(
                    child: HeroSection(key: _sectionKeys[0]),
                  ),

                  // About Section - Lazy loaded
                  SliverToBoxAdapter(
                    child: LazyLoadWidget(
                      placeholder: const SectionPlaceholder(height: 600),
                      child: AboutSection(key: _sectionKeys[1]),
                    ),
                  ),

                  // Projects Section - Lazy loaded with higher threshold
                  SliverToBoxAdapter(
                    child: LazyLoadWidget(
                      placeholder: const SectionPlaceholder(height: 800),
                      visibilityThreshold: 0.05,
                      child: ProjectsSection(key: _sectionKeys[2]),
                    ),
                  ),

                  // Skills Section - Lazy loaded
                  SliverToBoxAdapter(
                    child: LazyLoadWidget(
                      placeholder: const SectionPlaceholder(height: 500),
                      child: SkillsSection(key: _sectionKeys[3]),
                    ),
                  ),

                  // Certificates Section - Lazy loaded (image heavy)
                  SliverToBoxAdapter(
                    child: LazyLoadWidget(
                      placeholder: const SectionPlaceholder(height: 700),
                      visibilityThreshold: 0.05,
                      child: CertificatesSection(key: _sectionKeys[4]),
                    ),
                  ),

                  // Contact Section - Lazy loaded
                  SliverToBoxAdapter(
                    child: LazyLoadWidget(
                      placeholder: const SectionPlaceholder(height: 600),
                      child: ContactSection(key: _sectionKeys[5]),
                    ),
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
