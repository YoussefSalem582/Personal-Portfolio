import 'package:flutter/material.dart';
import '../../utils/assets/app_constants.dart';
import '../common/icon_badge.dart';

/// PDF Badge
class PdfBadge extends StatelessWidget {
  const PdfBadge({super.key});

  @override
  Widget build(BuildContext context) {
    return const PositionedBadge(
      top: 12,
      left: 12,
      badge: IconBadge(
        label: 'PDF',
        icon: AppIcons.pdf,
        backgroundColor: AppColors.errorLight,
      ),
    );
  }
}

/// Verified Badge
class VerifiedBadge extends StatelessWidget {
  const VerifiedBadge({super.key});

  @override
  Widget build(BuildContext context) {
    return const PositionedBadge(
      top: 12,
      right: 12,
      badge: IconBadge(
        label: 'Verified',
        icon: AppIcons.badge,
        backgroundColor: AppColors.successLight,
      ),
    );
  }
}
