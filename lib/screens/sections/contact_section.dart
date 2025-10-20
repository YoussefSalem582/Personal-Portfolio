import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import '../../theme/app_theme.dart';
import '../../utils/responsive_helper.dart';
import '../../utils/portfolio_data.dart';
import '../../utils/url_helper.dart';
import '../../models/contact_form.dart';

class ContactSection extends StatefulWidget {
  const ContactSection({super.key});

  @override
  State<ContactSection> createState() => _ContactSectionState();
}

class _ContactSectionState extends State<ContactSection> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _subjectController = TextEditingController();
  final _messageController = TextEditingController();

  bool _isSubmitting = false;
  String? _submitStatus;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _subjectController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = ResponsiveHelper.isMobile(screenWidth);
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      width: double.infinity,
      color: isDark
          ? AppTheme.darkBackgroundColor
          : AppTheme.primaryColor.withValues(alpha: 0.02),
      padding: EdgeInsets.symmetric(
        horizontal: ResponsiveHelper.getHorizontalPadding(screenWidth),
        vertical: AppTheme.spacingXXL,
      ),
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: ResponsiveHelper.getMaxWidth(screenWidth),
        ),
        child: AnimationLimiter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: AnimationConfiguration.toStaggeredList(
              duration: const Duration(milliseconds: 500),
              childAnimationBuilder: (widget) => SlideAnimation(
                verticalOffset: 50.0,
                child: FadeInAnimation(child: widget),
              ),
              children: [
                // Section title
                Text(
                  'Get In Touch',
                  style: (isDark
                          ? AppTheme.headingLargeForTheme(context)
                          : AppTheme.headingLarge)
                      .copyWith(fontSize: 36),
                  textAlign: TextAlign.center,
                ),

                const SizedBox(height: AppTheme.spacingS),

                Container(
                  width: 60,
                  height: 4,
                  decoration: BoxDecoration(
                    gradient: isDark
                        ? AppTheme.darkPrimaryGradient
                        : AppTheme.primaryGradient,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),

                const SizedBox(height: AppTheme.spacingM),

                Text(
                  'Let\'s discuss your next project or collaboration opportunity',
                  style: isDark
                      ? AppTheme.bodyLargeForTheme(context)
                      : AppTheme.bodyLarge,
                  textAlign: TextAlign.center,
                ),

                const SizedBox(height: AppTheme.spacingXL),

                // Contact content
                if (isMobile)
                  _buildMobileContactLayout()
                else
                  _buildDesktopContactLayout(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDesktopContactLayout() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Contact info
        Expanded(flex: 1, child: _buildContactInfo()),

        const SizedBox(width: AppTheme.spacingXXL),

        // Contact form
        Expanded(flex: 2, child: _buildContactForm()),
      ],
    );
  }

  Widget _buildMobileContactLayout() {
    return Column(
      children: [
        _buildContactInfo(),
        const SizedBox(height: AppTheme.spacingXL),
        _buildContactForm(),
      ],
    );
  }

  Widget _buildContactInfo() {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Contact Information',
          style: (isDark
                  ? AppTheme.headingMediumForTheme(context)
                  : AppTheme.headingMedium)
              .copyWith(fontSize: 24),
        ),

        const SizedBox(height: AppTheme.spacingL),

        _buildContactItem(
          Icons.email_outlined,
          'Email',
          PortfolioData.contactInfo.email,
          () => UrlHelper.launchEmail(email: PortfolioData.contactInfo.email),
        ),

        const SizedBox(height: AppTheme.spacingL),

        _buildContactItem(
          Icons.phone_outlined,
          'Phone',
          PortfolioData.contactInfo.phone,
          () => UrlHelper.launchPhone(PortfolioData.contactInfo.phone),
        ),

        const SizedBox(height: AppTheme.spacingL),

        _buildContactItem(
          Icons.location_on_outlined,
          'Location',
          PortfolioData.contactInfo.location,
          null,
        ),

        const SizedBox(height: AppTheme.spacingXL),

        // Social links
        Text(
          'Connect With Me',
          style: (isDark
                  ? AppTheme.headingSmallForTheme(context)
                  : AppTheme.headingSmall)
              .copyWith(fontSize: 18),
        ),

        const SizedBox(height: AppTheme.spacingL),

        Wrap(
          spacing: AppTheme.spacingL,
          children: PortfolioData.socialLinks.map((social) {
            return _buildSocialButton(
              social.name,
              social.iconPath,
              () => UrlHelper.launchURL(social.url),
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildContactItem(
    IconData icon,
    String title,
    String value,
    VoidCallback? onTap,
  ) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final accentColor =
        isDark ? AppTheme.darkAccentColor : AppTheme.accentColor;

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(AppTheme.radiusS),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: AppTheme.spacingS),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(AppTheme.spacingS),
              decoration: BoxDecoration(
                color: accentColor.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(AppTheme.radiusS),
              ),
              child: Icon(icon, size: 20, color: accentColor),
            ),
            const SizedBox(width: AppTheme.spacingM),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: (isDark
                            ? AppTheme.bodySmallForTheme(context)
                            : AppTheme.bodySmall)
                        .copyWith(
                      color: isDark
                          ? AppTheme.darkTextSecondary
                          : AppTheme.textSecondary,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    value,
                    style: (isDark
                            ? AppTheme.bodyMediumForTheme(context)
                            : AppTheme.bodyMedium)
                        .copyWith(
                      fontWeight: FontWeight.w600,
                      color: onTap != null
                          ? accentColor
                          : (isDark
                              ? AppTheme.darkTextPrimary
                              : AppTheme.textPrimary),
                    ),
                  ),
                ],
              ),
            ),
            if (onTap != null)
              Icon(Icons.arrow_outward, size: 16, color: accentColor),
          ],
        ),
      ),
    );
  }

  Widget _buildSocialButton(String title, String iconPath, VoidCallback onTap) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final accentColor =
        isDark ? AppTheme.darkAccentColor : AppTheme.accentColor;

    return OutlinedButton(
      onPressed: onTap,
      style: OutlinedButton.styleFrom(
        foregroundColor: accentColor,
        side: BorderSide(color: accentColor.withValues(alpha: 0.3)),
        padding: const EdgeInsets.symmetric(
          horizontal: AppTheme.spacingM,
          vertical: AppTheme.spacingS,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            _getIconForPlatform(title),
            color: accentColor,
            size: 18,
          ),
          const SizedBox(width: 8),
          Text(title),
        ],
      ),
    );
  }

  IconData _getIconForPlatform(String name) {
    switch (name.toLowerCase()) {
      case 'github':
        return Icons.code; // GitHub icon
      case 'linkedin':
        return Icons.work; // LinkedIn icon
      case 'youtube':
        return Icons.play_arrow; // YouTube icon
      case 'upwork':
        return Icons.work_outline; // Upwork icon
      default:
        return Icons.link;
    }
  }

  Widget _buildContactForm() {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Card(
      elevation: 8,
      shadowColor: isDark ? Colors.black26 : Colors.black12,
      child: Container(
        padding: const EdgeInsets.all(AppTheme.spacingXL),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppTheme.radiusL),
          color: isDark ? AppTheme.darkCardColor : AppTheme.surfaceColor,
        ),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Send Me a Message',
                style: (isDark
                        ? AppTheme.headingMediumForTheme(context)
                        : AppTheme.headingMedium)
                    .copyWith(fontSize: 24),
              ),

              const SizedBox(height: AppTheme.spacingL),

              // Name field
              _buildFormField(
                controller: _nameController,
                label: 'Your Name',
                hint: 'Enter your full name',
                icon: Icons.person_outline,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Please enter your name';
                  }
                  return null;
                },
              ),

              const SizedBox(height: AppTheme.spacingL),

              // Email field
              _buildFormField(
                controller: _emailController,
                label: 'Your Email',
                hint: 'Enter your email address',
                icon: Icons.email_outlined,
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Please enter your email';
                  }
                  if (!RegExp(
                    r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                  ).hasMatch(value)) {
                    return 'Please enter a valid email';
                  }
                  return null;
                },
              ),

              const SizedBox(height: AppTheme.spacingL),

              // Subject field
              _buildFormField(
                controller: _subjectController,
                label: 'Subject',
                hint: 'What is this about?',
                icon: Icons.subject_outlined,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Please enter a subject';
                  }
                  return null;
                },
              ),

              const SizedBox(height: AppTheme.spacingL),

              // Message field
              _buildFormField(
                controller: _messageController,
                label: 'Message',
                hint: 'Tell me about your project or inquiry...',
                icon: Icons.message_outlined,
                maxLines: 5,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Please enter your message';
                  }
                  if (value.trim().length < 10) {
                    return 'Message must be at least 10 characters';
                  }
                  return null;
                },
              ),

              const SizedBox(height: AppTheme.spacingXL),

              // Submit status
              if (_submitStatus != null) ...[
                Container(
                  padding: const EdgeInsets.all(AppTheme.spacingM),
                  decoration: BoxDecoration(
                    color: _submitStatus!.contains('Error')
                        ? AppTheme.errorColor.withValues(alpha: 0.1)
                        : AppTheme.successColor.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(AppTheme.radiusS),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        _submitStatus!.contains('Error')
                            ? Icons.error_outline
                            : Icons.check_circle_outline,
                        color: _submitStatus!.contains('Error')
                            ? AppTheme.errorColor
                            : AppTheme.successColor,
                      ),
                      const SizedBox(width: AppTheme.spacingM),
                      Expanded(
                        child: Text(
                          _submitStatus!,
                          style: AppTheme.bodyMedium.copyWith(
                            color: _submitStatus!.contains('Error')
                                ? AppTheme.errorColor
                                : AppTheme.successColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: AppTheme.spacingL),
              ],

              // Submit button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _isSubmitting ? null : _submitForm,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppTheme.primaryColor,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                      vertical: AppTheme.spacingL,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(AppTheme.radiusS),
                    ),
                  ),
                  child: _isSubmitting
                      ? const SizedBox(
                          height: 20,
                          width: 20,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            valueColor: AlwaysStoppedAnimation<Color>(
                              Colors.white,
                            ),
                          ),
                        )
                      : const Text(
                          'Send Message',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFormField({
    required TextEditingController controller,
    required String label,
    required String hint,
    required IconData icon,
    TextInputType? keyboardType,
    int maxLines = 1,
    String? Function(String?)? validator,
  }) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final accentColor =
        isDark ? AppTheme.darkAccentColor : AppTheme.accentColor;
    final textSecondary =
        isDark ? AppTheme.darkTextSecondary : AppTheme.textSecondary;
    final fillColor =
        isDark ? AppTheme.darkSurfaceColor : AppTheme.surfaceColor;

    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      maxLines: maxLines,
      validator: validator,
      style: TextStyle(
        color: isDark ? AppTheme.darkTextPrimary : AppTheme.textPrimary,
      ),
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        labelStyle: TextStyle(color: textSecondary),
        hintStyle: TextStyle(color: textSecondary.withValues(alpha: 0.6)),
        prefixIcon: Icon(icon, color: accentColor),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppTheme.radiusS),
          borderSide: BorderSide(
            color: textSecondary.withValues(alpha: 0.3),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppTheme.radiusS),
          borderSide: BorderSide(color: accentColor, width: 2),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppTheme.radiusS),
          borderSide: BorderSide(
            color: textSecondary.withValues(alpha: 0.3),
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppTheme.radiusS),
          borderSide: const BorderSide(color: AppTheme.errorColor),
        ),
        filled: true,
        fillColor: fillColor,
      ),
    );
  }

  Future<void> _submitForm() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() {
      _isSubmitting = true;
      _submitStatus = null;
    });

    try {
      final contactForm = ContactForm(
        name: _nameController.text.trim(),
        email: _emailController.text.trim(),
        subject: _subjectController.text.trim(),
        message: _messageController.text.trim(),
      );

      // For production, replace with your actual form submission endpoint
      // This is a placeholder implementation
      await _submitContactForm(contactForm);

      setState(() {
        _submitStatus =
            'Message sent successfully! I\'ll get back to you soon.';
        _isSubmitting = false;
      });

      // Clear form
      _nameController.clear();
      _emailController.clear();
      _subjectController.clear();
      _messageController.clear();
    } catch (e) {
      setState(() {
        _submitStatus =
            'Error sending message. Please try again or contact me directly.';
        _isSubmitting = false;
      });
    }
  }

  Future<void> _submitContactForm(ContactForm form) async {
    // Placeholder for form submission
    // In production, integrate with your preferred service:
    // - Formspree (https://formspree.io/)
    // - Netlify Forms (if deploying to Netlify)
    // - EmailJS (https://www.emailjs.com/)
    // - Your own backend API

    await Future.delayed(const Duration(seconds: 2)); // Simulate API call

    // Example with Formspree:
    /*
    final response = await http.post(
      Uri.parse('https://formspree.io/f/YOUR_FORM_ID'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'name': form.name,
        'email': form.email,
        'subject': form.subject,
        'message': form.message,
      }),
    );
    
    if (response.statusCode != 200) {
      throw Exception('Failed to submit form');
    }
    */
  }
}
