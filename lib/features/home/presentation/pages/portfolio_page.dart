import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../injection_container.dart';
import '../../../../core/routes/portfolio_section_routes.dart';
import '../../../../core/utils/assets/app_constants.dart';
import '../../../../core/utils/responsive_helper.dart';
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
  const PortfolioPage({super.key, this.initialSectionIndex = 0});

  /// Scroll target section (0–6); from [GoRouter] shell routes and deep links.
  final int initialSectionIndex;

  @override
  State<PortfolioPage> createState() => _PortfolioPageState();
}

class _PortfolioPageState extends State<PortfolioPage> {
  final ScrollController _scrollController = ScrollController();
  final List<GlobalKey> _sectionKeys =
      List.generate(HomeState.sectionCount, (index) => GlobalKey());

  BuildContext? _blocHostContext;
  Timer? _urlSyncDebounce;
  bool _didScheduleInitialRouteScroll = false;

  static const Duration _urlSyncDebounceDuration = Duration(milliseconds: 320);

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void didUpdateWidget(covariant PortfolioPage oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.initialSectionIndex == oldWidget.initialSectionIndex) {
      return;
    }
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) {
        return;
      }
      final ctx = _blocHostContext;
      if (ctx == null || !ctx.mounted) {
        return;
      }
      if (ctx.read<HomeBloc>().state.currentSection ==
          widget.initialSectionIndex) {
        return;
      }
      _scrollToSection(ctx, widget.initialSectionIndex);
    });
  }

  @override
  void dispose() {
    _urlSyncDebounce?.cancel();
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  void _ensureInitialRouteScrollOnce() {
    if (_didScheduleInitialRouteScroll) {
      return;
    }
    _didScheduleInitialRouteScroll = true;
    if (widget.initialSectionIndex == 0) {
      return;
    }
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.delayed(const Duration(milliseconds: 150), () {
        if (!mounted) {
          return;
        }
        final ctx = _blocHostContext;
        if (ctx == null || !ctx.mounted) {
          return;
        }
        _scrollToSection(ctx, widget.initialSectionIndex);
      });
    });
  }

  void _onScroll() {
    for (var i = 0; i < _sectionKeys.length; i++) {
      final sectionCtx = _sectionKeys[i].currentContext;
      if (sectionCtx != null) {
        final box = sectionCtx.findRenderObject()! as RenderBox;
        final position = box.localToGlobal(Offset.zero);

        if (position.dy <= 100 && position.dy > -box.size.height + 100) {
          final host = _blocHostContext;
          if (host == null) {
            break;
          }
          final homeBloc = host.read<HomeBloc>();
          if (homeBloc.state.currentSection != i) {
            homeBloc.add(HomeSectionIndexChanged(i));
          }
          _scheduleUrlSyncForScroll(i);
          break;
        }
      }
    }
  }

  void _scheduleUrlSyncForScroll(int index) {
    _urlSyncDebounce?.cancel();
    _urlSyncDebounce = Timer(_urlSyncDebounceDuration, () {
      _urlSyncDebounce = null;
      if (!mounted) {
        return;
      }
      final ctx = _blocHostContext;
      if (ctx == null || !ctx.mounted) {
        return;
      }
      final router = GoRouter.of(ctx);
      final currentPath = PortfolioSectionRoutes.normalizePath(
        router.state.uri.path,
      );
      if (PortfolioSectionRoutes.pathMatchesIndex(currentPath, index)) {
        return;
      }
      router.go(PortfolioSectionRoutes.pathForIndex(index));
    });
  }

  void _scrollToSection(BuildContext blocContext, int index) {
    if (index < 0 || index >= _sectionKeys.length) {
      return;
    }

    if (index == 0) {
      _scrollController.animateTo(
        0.0,
        duration: const Duration(milliseconds: 600),
        curve: Curves.easeInOutCubic,
      );
      blocContext.read<HomeBloc>().add(const HomeSectionIndexChanged(0));
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

      blocContext.read<HomeBloc>().add(HomeSectionIndexChanged(index));
    } else {
      Future.delayed(const Duration(milliseconds: 100), () {
        if (!mounted) {
          return;
        }
        final ctx = _blocHostContext;
        if (ctx == null || !ctx.mounted) {
          return;
        }
        _scrollToSection(ctx, index);
      });
    }
  }

  void _onSectionSelected(BuildContext blocContext, int index) {
    final path = PortfolioSectionRoutes.pathForIndex(index);
    final currentPath = PortfolioSectionRoutes.normalizePath(
      GoRouter.of(blocContext).state.uri.path,
    );
    if (PortfolioSectionRoutes.pathMatchesIndex(currentPath, index)) {
      _scrollToSection(blocContext, index);
      return;
    }
    blocContext.go(path);
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
      child: Builder(
        builder: (blocContext) {
          _blocHostContext = blocContext;
          _ensureInitialRouteScrollOnce();

          return Scaffold(
            backgroundColor:
                isDark ? AppColors.backgroundDark : AppColors.backgroundLight,
            drawer: isMobile
                ? BlocBuilder<HomeBloc, HomeState>(
                    buildWhen: (prev, curr) =>
                        prev.currentSection != curr.currentSection,
                    builder: (ctx, homeState) {
                      return AppNavigation.buildDrawer(
                        ctx,
                        (i) => _onSectionSelected(blocContext, i),
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
                      onItemSelected: (i) => _onSectionSelected(blocContext, i),
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
                          onNavigateToSection: (i) =>
                              _onSectionSelected(blocContext, i),
                        ),
                      ),
                      SliverToBoxAdapter(
                        child: AboutSection(
                          key: _sectionKeys[1],
                          onNavigateToContact: () =>
                              _onSectionSelected(blocContext, 6),
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
                          onNavigateToSection: (i) =>
                              _onSectionSelected(blocContext, i),
                          onScrollToTop: () =>
                              _onSectionSelected(blocContext, 0),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            floatingActionButton: isMobile
                ? FloatingActionButton(
                    onPressed: () => _onSectionSelected(blocContext, 6),
                    backgroundColor:
                        isDark ? AppColors.accentDark : AppColors.accentLight,
                    child: Icon(
                      AppIcons.message,
                      color: isDark
                          ? AppColors.textPrimaryDark
                          : AppColors.surfaceLight,
                    ),
                  )
                : null,
          );
        },
      ),
    );
  }
}
