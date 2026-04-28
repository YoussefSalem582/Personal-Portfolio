import 'package:flutter/material.dart';

import '../utils/assets/app_constants.dart';
import '../widgets/navigation/app_navigation.dart';
import '../utils/responsive_helper.dart';
import 'sections/about_section.dart';
import 'sections/certificates_section.dart';
import 'sections/contact_section.dart';
import 'sections/expertise_section.dart';
import 'sections/hero_section.dart';
import 'sections/projects_section.dart';
import 'sections/skills_section.dart';
import '../widgets/footer.dart';

class PortfolioScreen extends StatefulWidget {
  const PortfolioScreen({super.key, this.initialSectionIndex});

  /// Scroll target section (0–6) after first layout; used by section deep links.
  final int? initialSectionIndex;

  @override
  State<PortfolioScreen> createState() => _PortfolioScreenState();
}

class _PortfolioScreenState extends State<PortfolioScreen> {
  final ScrollController _scrollController = ScrollController();
  final List<GlobalKey> _sectionKeys = List.generate(7, (index) => GlobalKey());
  int _currentSection = 0;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
    final idx = widget.initialSectionIndex;
    if (idx != null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Future.delayed(const Duration(milliseconds: 150), () {
          if (!mounted) return;
          _scrollToSection(idx);
        });
      });
    }
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
    // Validate index
    if (index < 0 || index >= _sectionKeys.length) {
      return;
    }

    // Special handling for section 0 (home) - always scroll to top
    if (index == 0) {
      _scrollController.animateTo(
        0.0,
        duration: const Duration(milliseconds: 600),
        curve: Curves.easeInOutCubic,
      );
      setState(() {
        _currentSection = 0;
      });
      return;
    }

    // Get the section's GlobalKey
    final key = _sectionKeys[index];
    final context = key.currentContext;

    if (context != null) {
      // Use Scrollable.ensureVisible for precise, automatic scrolling
      // This method calculates the exact position needed
      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 600),
        curve: Curves.easeInOutCubic,
        alignment: 0.0, // Align to top of viewport
        alignmentPolicy: ScrollPositionAlignmentPolicy.explicit,
      );

      // Update current section
      setState(() {
        _currentSection = index;
      });
    } else {
      // Fallback: If context is not available, try after a short delay
      Future.delayed(const Duration(milliseconds: 100), () {
        if (mounted) {
          _scrollToSection(index);
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = ResponsiveHelper.isMobile(screenWidth);
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor:
          isDark ? AppColors.backgroundDark : AppColors.backgroundLight,
      drawer: isMobile
          ? AppNavigation.buildDrawer(
              context, _scrollToSection, _currentSection)
          : null,
      body: Column(
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
                    child: HeroSection(
                      key: _sectionKeys[0],
                      onNavigateToSection: _scrollToSection,
                    ),
                  ),

                  // About Section
                  SliverToBoxAdapter(
                    child: AboutSection(
                      key: _sectionKeys[1],
                      onNavigateToContact: () => _scrollToSection(6),
                    ),
                  ),

                  // Skills Section
                  SliverToBoxAdapter(
                    child: SkillsSection(key: _sectionKeys[2]),
                  ),

                  // Expertise Section
                  SliverToBoxAdapter(
                    child: ExpertiseSection(key: _sectionKeys[3]),
                  ),

                  // Projects Section
                  SliverToBoxAdapter(
                    child: ProjectsSection(key: _sectionKeys[4]),
                  ),

                  // Certificates Section
                  SliverToBoxAdapter(
                    child: CertificatesSection(key: _sectionKeys[5]),
                  ),

                  // Contact Section
                  SliverToBoxAdapter(
                    child: ContactSection(key: _sectionKeys[6]),
                  ),

                  // Footer - Always load
                  SliverToBoxAdapter(
                    child: Footer(
                      onNavigateToSection: _scrollToSection,
                      onScrollToTop: () => _scrollToSection(0),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),

      // Floating Action Button for mobile
      floatingActionButton: isMobile
          ? FloatingActionButton(
              onPressed: () => _scrollToSection(6), // Go to contact
              backgroundColor:
                  isDark ? AppColors.accentDark : AppColors.accentLight,
              child: Icon(
                AppIcons.message,
                color:
                    isDark ? AppColors.textPrimaryDark : AppColors.surfaceLight,
              ),
            )
          : null,
    );
  }
}
