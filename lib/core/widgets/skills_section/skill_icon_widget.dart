import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../../utils/assets/app_constants.dart';

/// Skill Icon Widget
/// Handles displaying skill icons from local assets (SVG/PNG) and network URLs with fallback
class SkillIconWidget extends StatelessWidget {
  final String skillId;
  final double size;
  final Color color;

  const SkillIconWidget({
    super.key,
    required this.skillId,
    required this.size,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    // Try to get icon asset from centralized AppIcons first
    final iconPath = AppIcons.getSkillIconSvg(skillId);

    if (iconPath != null) {
      // Check if it's a PNG or SVG file
      if (iconPath.toLowerCase().endsWith('.png')) {
        // Use local PNG asset
        return Image.asset(
          iconPath,
          width: size,
          height: size,
          fit: BoxFit.contain,
          errorBuilder: (context, error, stackTrace) {
            debugPrint('Failed to load PNG icon for $skillId: $error');
            return Icon(
              AppIcons.technology,
              size: size,
              color: color,
            );
          },
        );
      } else {
        // Use local SVG asset
        return SvgPicture.asset(
          iconPath,
          width: size,
          height: size,
          fit: BoxFit.contain,
          allowDrawingOutsideViewBox: true,
        );
      }
    }

    // Try network icon URL
    final iconUrl = _getNetworkIconUrl(skillId);
    if (iconUrl != null) {
      return CachedNetworkImage(
        imageUrl: iconUrl,
        width: size,
        height: size,
        fit: BoxFit.contain,
        placeholder: (context, url) => SizedBox(
          width: size,
          height: size,
          child: Center(
            child: CircularProgressIndicator(
              strokeWidth: 2,
              valueColor: AlwaysStoppedAnimation<Color>(color.withOpacity(0.5)),
            ),
          ),
        ),
        errorWidget: (context, url, error) {
          debugPrint('Failed to load icon for $skillId: $error');
          return Icon(
            AppIcons.technology,
            size: size,
            color: color,
          );
        },
      );
    }

    // Final fallback to Material Icon
    return Icon(
      AppIcons.technology,
      size: size,
      color: color,
    );
  }

  /// Get network icon URL from CDN for skills without SVG
  String? _getNetworkIconUrl(String skillId) {
    final iconUrls = {
      // Languages
      'cpp':
          'https://cdn.jsdelivr.net/gh/devicons/devicon/icons/cplusplus/cplusplus-original.svg',
      'javascript':
          'https://cdn.jsdelivr.net/gh/devicons/devicon/icons/javascript/javascript-original.svg',

      // UI/UX & Web
      'native-ui-ux':
          'https://cdn.jsdelivr.net/gh/devicons/devicon/icons/figma/figma-original.svg',
      'responsive-web':
          'https://cdn.jsdelivr.net/gh/devicons/devicon/icons/html5/html5-original.svg',

      // Cloud & Backend
      'supabase':
          'https://cdn.jsdelivr.net/gh/devicons/devicon/icons/supabase/supabase-original.svg',
      'custom-backend':
          'https://cdn.jsdelivr.net/gh/devicons/devicon/icons/nodejs/nodejs-original.svg',

      // Communication
      'emailjs':
          'https://cdn.jsdelivr.net/gh/devicons/devicon/icons/google/google-original.svg',
    };

    return iconUrls[skillId.toLowerCase()];
  }
}
