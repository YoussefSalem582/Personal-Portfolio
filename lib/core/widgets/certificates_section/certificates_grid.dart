import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import '../../../models/certificate.dart';
import '../../../utils/responsive_helper.dart';
import 'certificate_card.dart';

/// Certificates Grid
/// Displays certificates in a responsive grid with staggered animations
class CertificatesGrid extends StatelessWidget {
  final List<Certificate> certificates;
  final double screenWidth;

  const CertificatesGrid({
    super.key,
    required this.certificates,
    required this.screenWidth,
  });

  @override
  Widget build(BuildContext context) {
    final crossAxisCount =
        ResponsiveHelper.getCertificateGridColumns(screenWidth);
    final spacing = ResponsiveHelper.getSpacing(screenWidth);
    final isMobile = ResponsiveHelper.isMobile(screenWidth);
    final isSmallMobile = ResponsiveHelper.isSmallMobile(screenWidth);

    return AnimationLimiter(
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: crossAxisCount,
          crossAxisSpacing: spacing,
          mainAxisSpacing: spacing,
          childAspectRatio: isSmallMobile ? 0.65 : (isMobile ? 0.80 : 0.85),
        ),
        itemCount: certificates.length,
        itemBuilder: (context, index) {
          return AnimationConfiguration.staggeredGrid(
            position: index,
            duration: const Duration(milliseconds: 500),
            columnCount: crossAxisCount,
            child: SlideAnimation(
              verticalOffset: 50,
              child: FadeInAnimation(
                child: CertificateCard(
                  certificate: certificates[index],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
