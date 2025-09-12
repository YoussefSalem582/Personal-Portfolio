import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../widgets/app_navigation.dart';
import '../utils/responsive_helper.dart';
import 'sections/hero_section.dart';
import 'sections/about_section.dart';
import 'sections/projects_section.dart';
import 'sections/skills_section.dart';
import 'sections/contact_section.dart';
import '../widgets/footer.dart';

class PortfolioScreen extends StatefulWidget {
  const PortfolioScreen({super.key});

  @override
  State<PortfolioScreen> createState() => _PortfolioScreenState();
}

class _PortfolioScreenState extends State<PortfolioScreen> {
  final ScrollController _scrollController = ScrollController();
  final List<GlobalKey> _sectionKeys = List.generate(5, (index) => GlobalKey());
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

    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      drawer: isMobile
          ? AppNavigation(
              onItemSelected: _scrollToSection,
              currentIndex: _currentSection,
            ).buildMobileDrawer(context)
          : null,
      body: Column(
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

                  // Contact Section
                  ContactSection(key: _sectionKeys[4]),

                  // Footer
                  const Footer(),
                ],
              ),
            ),
          ),
        ],
      ),

      // Floating Action Button for mobile
      floatingActionButton: isMobile
          ? FloatingActionButton(
              onPressed: () => _scrollToSection(4), // Go to contact
              backgroundColor: AppTheme.accentColor,
              child: const Icon(Icons.message, color: AppTheme.surfaceColor),
            )
          : null,
    );
  }
}
