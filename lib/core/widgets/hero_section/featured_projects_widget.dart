// import 'package:flutter/material.dart';
// import '../../../utils/assets/app_constants.dart';
// import '../../../utils/data/portfolio_data.dart';
// import '../../../utils/responsive_helper.dart';
// import '../../widgets/project_card.dart';
// import '../../theme/app_theme.dart';

// class FeaturedProjectsWidget extends StatelessWidget {
//   const FeaturedProjectsWidget({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final screenWidth = MediaQuery.of(context).size.width;
//     final featuredProjects = PortfolioData.featuredProjects.take(2).toList();
//     final isDark = Theme.of(context).brightness == Brightness.dark;
//     final isMobile = ResponsiveHelper.isMobile(screenWidth);

//     // Return empty container if no featured projects
//     if (featuredProjects.isEmpty) {
//       return const SizedBox.shrink();
//     }

//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       mainAxisSize: MainAxisSize.min,
//       children: [
//         // Section Title with icon
//         Row(
//           children: [
//             Icon(
//               AppIcons.projects,
//               size: 28,
//               color: isDark ? AppColors.accentDark : AppColors.accentLight,
//             ),
//             const SizedBox(width: AppTheme.spacingS),
//             Text(
//               'Featured Projects',
//               style: AppFonts.h3().copyWith(
//                 color: isDark
//                     ? AppColors.textPrimaryDark
//                     : AppColors.textPrimaryLight,
//                 fontWeight: AppFonts.bold,
//               ),
//             ),
//           ],
//         ),
//         const SizedBox(height: AppTheme.spacingL),

//         // Projects Grid/List
//         if (isMobile)
//           // Mobile: Single column with proper spacing
//           _buildMobileLayout(featuredProjects)
//         else
//           // Desktop/Tablet: Row layout with equal spacing
//           _buildDesktopLayout(featuredProjects),
//       ],
//     );
//   }

//   Widget _buildMobileLayout(List featuredProjects) {
//     return Column(
//       mainAxisSize: MainAxisSize.min,
//       children: featuredProjects.asMap().entries.map((entry) {
//         final index = entry.key;
//         final project = entry.value;
//         return Padding(
//           padding: EdgeInsets.only(
//             bottom: index < featuredProjects.length - 1 ? AppTheme.spacingM : 0,
//           ),
//           child: ConstrainedBox(
//             constraints: const BoxConstraints(
//               maxWidth: 600, // Limit width on mobile for better readability
//               minHeight: 280, // Ensure minimum height to prevent overflow
//             ),
//             child: ProjectCard(
//               project: project,
//               isCompact: true,
//             ),
//           ),
//         );
//       }).toList(),
//     );
//   }

//   Widget _buildDesktopLayout(List featuredProjects) {
//     return IntrinsicHeight(
//       child: Row(
//         crossAxisAlignment: CrossAxisAlignment.stretch,
//         children: featuredProjects.asMap().entries.map((entry) {
//           final index = entry.key;
//           final project = entry.value;
//           return Expanded(
//             child: Padding(
//               padding: EdgeInsets.only(
//                 right:
//                     index < featuredProjects.length - 1 ? AppTheme.spacingM : 0,
//               ),
//               child: ConstrainedBox(
//                 constraints: const BoxConstraints(
//                   minHeight: 300, // Ensure minimum height to prevent overflow
//                 ),
//                 child: ProjectCard(
//                   project: project,
//                   isCompact: true,
//                 ),
//               ),
//             ),
//           );
//         }).toList(),
//       ),
//     );
//   }
// }
