import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../utils/assets/app_constants.dart';
import '../../utils/assets/app_icons.dart';
import '../../utils/url_helper.dart';
import '../../utils/data/portfolio_data.dart';

/// Links dropdown button widget that displays external links
/// (GitHub, LinkedIn, YouTube, Resume)
class LinksDropdownButton extends StatefulWidget {
  final bool isDark;

  const LinksDropdownButton({super.key, required this.isDark});

  @override
  State<LinksDropdownButton> createState() => _LinksDropdownButtonState();
}

class _LinksDropdownButtonState extends State<LinksDropdownButton> {
  final GlobalKey _buttonKey = GlobalKey();
  OverlayEntry? _overlayEntry;
  bool _isOpen = false;

  void _toggleDropdown() {
    if (_isOpen) {
      _closeDropdown();
    } else {
      _openDropdown();
    }
  }

  void _openDropdown() {
    final RenderBox renderBox =
        _buttonKey.currentContext!.findRenderObject() as RenderBox;
    final size = renderBox.size;
    final offset = renderBox.localToGlobal(Offset.zero);

    _overlayEntry = OverlayEntry(
      builder: (context) => Stack(
        children: [
          // Backdrop to close dropdown
          Positioned.fill(
            child: GestureDetector(
              onTap: _closeDropdown,
              behavior: HitTestBehavior.translucent,
              child: Container(color: Colors.transparent),
            ),
          ),
          // Dropdown menu
          Positioned(
            left: offset.dx,
            top: offset.dy + size.height + 8,
            child: Material(
              elevation: 8,
              borderRadius: BorderRadius.circular(12),
              color: widget.isDark
                  ? AppColors.surfaceDark
                  : AppColors.surfaceLight,
              child: Container(
                width: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: widget.isDark
                        ? AppColors.white.withValues(alpha: 0.1)
                        : AppColors.black.withValues(alpha: 0.08),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.black.withValues(alpha: 0.2),
                      blurRadius: 16,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _buildDropdownItemWithSvg(
                      svgPath: AppIcons.githubIconSvg,
                      label: 'GitHub Profile',
                      onTap: () {
                        _closeDropdown();
                        final githubLink = PortfolioData.socialLinks
                            .firstWhere((link) => link.name == 'GitHub');
                        UrlHelper.launchURL(githubLink.url);
                      },
                    ),
                    _buildDivider(),
                    _buildDropdownItemWithSvg(
                      svgPath: AppIcons.linkedinIconSvg,
                      label: 'LinkedIn Profile',
                      onTap: () {
                        _closeDropdown();
                        final linkedInLink = PortfolioData.socialLinks
                            .firstWhere((link) => link.name == 'LinkedIn');
                        UrlHelper.launchURL(linkedInLink.url);
                      },
                    ),
                    _buildDivider(),
                    _buildDropdownItemWithSvg(
                      svgPath: AppIcons.youtubeIconSvg,
                      label: 'YouTube Channel',
                      onTap: () {
                        _closeDropdown();
                        final youtubeLink = PortfolioData.socialLinks
                            .firstWhere((link) => link.name == 'YouTube',
                                orElse: () => PortfolioData.socialLinks.first);
                        UrlHelper.launchURL(youtubeLink.url);
                      },
                    ),
                    _buildDivider(),
                    _buildDropdownItem(
                      icon: AppIcons.download,
                      label: 'Resume',
                      onTap: () async {
                        _closeDropdown();
                        try {
                          await UrlHelper.openFile(PortfolioData.resumeUrl);
                        } catch (e) {
                          if (context.mounted) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Error opening resume'),
                                backgroundColor: AppColors.errorLight,
                              ),
                            );
                          }
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );

    Overlay.of(context).insert(_overlayEntry!);
    setState(() => _isOpen = true);
  }

  void _closeDropdown() {
    _overlayEntry?.remove();
    _overlayEntry = null;
    if (mounted) {
      setState(() => _isOpen = false);
    }
  }

  Widget _buildDropdownItem({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          children: [
            Icon(
              icon,
              size: 20,
              color: widget.isDark
                  ? AppColors.textSecondaryDark
                  : AppColors.textSecondaryLight,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                label,
                style: AppFonts.bodyMedium(
                  color: widget.isDark
                      ? AppColors.textPrimaryDark
                      : AppColors.textPrimaryLight,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDropdownItemWithSvg({
    required String svgPath,
    required String label,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          children: [
            SvgPicture.asset(
              svgPath,
              width: 32,
              height: 32,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                label,
                style: AppFonts.bodyMedium(
                  color: widget.isDark
                      ? AppColors.textPrimaryDark
                      : AppColors.textPrimaryLight,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDivider() {
    return Divider(
      height: 1,
      thickness: 1,
      color: widget.isDark
          ? AppColors.white.withValues(alpha: 0.08)
          : AppColors.black.withValues(alpha: 0.06),
    );
  }

  @override
  void dispose() {
    _closeDropdown();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      key: _buttonKey,
      color: Colors.transparent,
      child: InkWell(
        onTap: _toggleDropdown,
        borderRadius: BorderRadius.circular(10),
        hoverColor:
            (widget.isDark ? AppColors.accentDark : AppColors.accentLight)
                .withValues(alpha: 0.1),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Links',
                style: AppFonts.labelLarge().copyWith(
                  color: widget.isDark
                      ? AppColors.textPrimaryDark
                      : AppColors.textPrimaryLight,
                  fontWeight: AppFonts.regular,
                  letterSpacing: 0.3,
                ),
              ),
              const SizedBox(width: 8),
              AnimatedRotation(
                turns: _isOpen ? 0.5 : 0,
                duration: const Duration(milliseconds: 200),
                child: Icon(
                  AppIcons.arrowDown,
                  size: 20,
                  color: widget.isDark
                      ? AppColors.textSecondaryDark
                      : AppColors.textSecondaryLight,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
