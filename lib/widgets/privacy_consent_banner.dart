import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import '../theme/app_theme.dart';

class PrivacyConsentBanner extends StatefulWidget {
  const PrivacyConsentBanner({super.key});

  @override
  State<PrivacyConsentBanner> createState() => _PrivacyConsentBannerState();
}

class _PrivacyConsentBannerState extends State<PrivacyConsentBanner>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Offset> _slideAnimation;
  bool _isVisible = false;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 1),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));

    _checkConsentStatus();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _checkConsentStatus() {
    // Only check consent on web platform
    if (!kIsWeb) return;

    // Check if user has already made a choice
    // For now, we'll skip localStorage to avoid dart:html issues
    // Always show the banner initially
    setState(() {
      _isVisible = true;
    });
    _animationController.forward();
  }

  void _handleConsent(bool accepted) {
    if (!kIsWeb) return;

    // For now, we'll skip localStorage to avoid dart:html issues
    debugPrint('Analytics consent: $accepted');

    if (accepted) {
      // Initialize Google Analytics
      _initializeAnalytics();
    }

    _animationController.reverse().then((_) {
      setState(() {
        _isVisible = false;
      });
    });
  }

  void _initializeAnalytics() {
    if (!kIsWeb) return;

    // This would be called when user consents
    // The actual GA initialization is handled in index.html
    // For now, we'll skip window.location.reload to avoid dart:html issues
    debugPrint('Analytics initialization requested');
  }

  @override
  Widget build(BuildContext context) {
    // Only show on web platform
    if (!kIsWeb || !_isVisible) return const SizedBox.shrink();

    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: SlideTransition(
        position: _slideAnimation,
        child: Container(
          margin: const EdgeInsets.all(16),
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: isDark ? AppTheme.darkSurfaceColor : AppTheme.surfaceColor,
            borderRadius: BorderRadius.circular(AppTheme.radiusM),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 10,
                spreadRadius: 2,
              ),
            ],
            border: Border.all(
              color: AppTheme.accentColor.withOpacity(0.2),
              width: 1,
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.privacy_tip_outlined,
                    color: isDark
                        ? AppTheme.darkAccentColor
                        : AppTheme.accentColor,
                    size: 24,
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      'Privacy & Analytics',
                      style: AppTheme.headingSmall.copyWith(
                        color: isDark
                            ? AppTheme.darkTextPrimary
                            : AppTheme.textPrimary,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Text(
                'This website uses Google Analytics to understand how visitors interact with the site. '
                'No personal information is collected, and all data is anonymized. '
                'You can choose to opt-out at any time.',
                style: AppTheme.bodyMedium.copyWith(
                  color: isDark
                      ? AppTheme.darkTextSecondary
                      : AppTheme.textSecondary,
                ),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () => _handleConsent(false),
                    style: TextButton.styleFrom(
                      foregroundColor: isDark
                          ? AppTheme.darkTextSecondary
                          : AppTheme.textSecondary,
                    ),
                    child: const Text('Decline'),
                  ),
                  const SizedBox(width: 12),
                  ElevatedButton(
                    onPressed: () => _handleConsent(true),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppTheme.accentColor,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 12,
                      ),
                    ),
                    child: const Text('Accept'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
