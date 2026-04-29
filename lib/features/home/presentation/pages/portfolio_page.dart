import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../injection_container.dart';
import '../../../../utils/assets/app_constants.dart';
import '../../../../utils/responsive_helper.dart';
import '../../../../core/widgets/footer.dart';
import '../../../../core/widgets/navigation/app_navigation.dart';
import '../../../about/presentation/about_section.dart';
import '../../../certificates/presentation/bloc/certificates_bloc.dart';
import '../../../certificates/presentation/certificates_section.dart';
import '../../../expertise/presentation/expertise_section.dart';
import '../../../hero/presentation/bloc/hero_bloc.dart';
import '../../../about/presentation/bloc/about_bloc.dart';
import '../../../skills/presentation/bloc/skills_bloc.dart';
import '../../../expertise/presentation/bloc/expertise_bloc.dart';
import '../../../hero/presentation/hero_section.dart';
import '../../../skills/presentation/skills_section.dart';
import '../../../contact/presentation/bloc/contact_bloc.dart';
import '../../../contact/presentation/widgets/contact_section.dart';
import '../../../projects/presentation/bloc/projects_bloc.dart';
import '../../../projects/presentation/widgets/projects_section.dart';
import '../bloc/home_bloc.dart';
import '../bloc/home_event.dart';
import '../bloc/home_state.dart';

/// Main portfolio shell: hero, sections, footer, and section scroll/navigation.
class PortfolioPage extends StatefulWidget {
  const PortfolioPage({super.key, this.initialSectionIndex});

  /// Scroll target section (0–6) after first layout; used by section deep links.
  final int? initialSectionIndex;

  @override
  State<PortfolioPage> createState() => _PortfolioPageState();
}

class _PortfolioPageState extends State<PortfolioPage> {
  final ScrollController _scrollController = ScrollController();
  final List<GlobalKey> _sectionKeys =
      List.generate(HomeState.sectionCount, (index) => GlobalKey());

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.delayed(const Duration(milliseconds: 150), () {
        if (!mounted) return;
        final section = context.read<HomeBloc>().state.currentSection;
        if (section != 0) {
          _scrollToSection(section);
        }
      });
    });
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    for (int i = 0; i < _sectionKeys.length; i++) {
      final ctx = _sectionKeys[i].currentContext;
      if (ctx != null) {
        final box = ctx.findRenderObject() as RenderBox;
        final position = box.localToGlobal(Offset.zero);

        if (position.dy <= 100 && position.dy > -box.size.height + 100) {
          final homeBloc = context.read<HomeBloc>();
          if (homeBloc.state.currentSection != i) {
            homeBloc.add(HomeSectionIndexChanged(i));
          }
          break;
        }
      }
    }
  }

  void _scrollToSection(int index) {
    if (index < 0 || index >= _sectionKeys.length) {
      return;
    }

    if (index == 0) {
      _scrollController.animateTo(
        0.0,
        duration: const Duration(milliseconds: 600),
        curve: Curves.easeInOutCubic,
      );
      context.read<HomeBloc>().add(const HomeSectionIndexChanged(0));
      return;
    }

    final key = _sectionKeys[index];
    final sectionContext = key.currentContext;

    if (sectionContext != null) {
      Scrollable.ensureVisible(
        sectionContext,
        duration: const Duration(milliseconds: 600),
        curve: Curves.easeInOutCubic,
        alignment: 0.0,
        alignmentPolicy: ScrollPositionAlignmentPolicy.explicit,
      );

      context.read<HomeBloc>().add(HomeSectionIndexChanged(index));
    } else {
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

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => HomeBloc(
            resolveInitialSection: sl(),
            routeSectionOverride: widget.initialSectionIndex,
          ),
        ),
        BlocProvider(create: (_) => sl<HeroBloc>()),
        BlocProvider(create: (_) => sl<AboutBloc>()),
        BlocProvider(create: (_) => sl<SkillsBloc>()),
        BlocProvider(create: (_) => sl<ExpertiseBloc>()),
        BlocProvider(create: (_) => sl<CertificatesBloc>()),
        BlocProvider(create: (_) => sl<ContactBloc>()),
        BlocProvider(create: (_) => sl<ProjectsBloc>()),
      ],
      child: Scaffold(
      backgroundColor:
          isDark ? AppColors.backgroundDark : AppColors.backgroundLight,
      drawer: isMobile
          ? BlocBuilder<HomeBloc, HomeState>(
              buildWhen: (prev, curr) =>
                  prev.currentSection != curr.currentSection,
              builder: (ctx, homeState) {
                return AppNavigation.buildDrawer(
                  ctx,
                  _scrollToSection,
                  homeState.currentSection,
                );
              },
            )
          : null,
      body: Column(
        children: [
          BlocBuilder<HomeBloc, HomeState>(
            buildWhen: (prev, curr) =>
                prev.currentSection != curr.currentSection,
            builder: (ctx, homeState) {
              return AppNavigation(
                onItemSelected: _scrollToSection,
                currentIndex: homeState.currentSection,
              );
            },
          ),
          Expanded(
            child: CustomScrollView(
              controller: _scrollController,
              physics: const BouncingScrollPhysics(
                parent: AlwaysScrollableScrollPhysics(),
              ),
              cacheExtent: 1000,
              slivers: [
                SliverToBoxAdapter(
                  child: HeroSection(
                    key: _sectionKeys[0],
                    onNavigateToSection: _scrollToSection,
                  ),
                ),
                SliverToBoxAdapter(
                  child: AboutSection(
                    key: _sectionKeys[1],
                    onNavigateToContact: () => _scrollToSection(6),
                  ),
                ),
                SliverToBoxAdapter(
                  child: SkillsSection(key: _sectionKeys[2]),
                ),
                SliverToBoxAdapter(
                  child: ExpertiseSection(key: _sectionKeys[3]),
                ),
                SliverToBoxAdapter(
                  child: ProjectsSection(key: _sectionKeys[4]),
                ),
                SliverToBoxAdapter(
                  child: CertificatesSection(key: _sectionKeys[5]),
                ),
                SliverToBoxAdapter(
                  child: ContactSection(key: _sectionKeys[6]),
                ),
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
      floatingActionButton: isMobile
          ? FloatingActionButton(
              onPressed: () => _scrollToSection(6),
              backgroundColor:
                  isDark ? AppColors.accentDark : AppColors.accentLight,
              child: Icon(
                AppIcons.message,
                color:
                    isDark ? AppColors.textPrimaryDark : AppColors.surfaceLight,
              ),
            )
          : null,
    ),
    );
  }
}
