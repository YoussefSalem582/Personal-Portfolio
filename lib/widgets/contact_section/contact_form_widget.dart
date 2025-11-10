import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../utils/assets/app_constants.dart';
import '../../models/contact_form.dart';
import '../../config/api_keys.dart';
import 'contact_form_field_widget.dart';
import 'submit_status_widget.dart';

import '../../theme/app_theme.dart';

/// A comprehensive contact form widget with validation and submission handling.
///
/// This widget provides a complete contact form with four fields: name, email,
/// subject, and message. It includes form validation, loading states, and
/// success/error feedback. The form is contained in a styled card with
/// theme-aware colors.
class ContactFormWidget extends StatefulWidget {
  const ContactFormWidget({super.key});

  @override
  State<ContactFormWidget> createState() => _ContactFormWidgetState();
}

class _ContactFormWidgetState extends State<ContactFormWidget> {
  // Form key for validation
  final _formKey = GlobalKey<FormState>();

  // Text controllers for form fields
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _subjectController = TextEditingController();
  final _messageController = TextEditingController();

  // Form submission state
  bool _isSubmitting = false;
  String? _submitStatus;

  @override
  void dispose() {
    // Clean up text controllers when widget is disposed
    _nameController.dispose();
    _emailController.dispose();
    _subjectController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Determine theme mode for styling
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 768;
    final isSmallMobile = screenWidth < 375;

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
            isMobile ? AppTheme.radiusL : AppTheme.radiusXL),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: isDark
              ? [
                  AppColors.cardDark,
                  AppColors.surfaceDark,
                ]
              : [
                  AppColors.white,
                  AppColors.surfaceLight,
                ],
        ),
        boxShadow: [
          BoxShadow(
            color: isDark
                ? AppColors.black.withValues(alpha: 0.3)
                : AppColors.black.withValues(alpha: 0.08),
            blurRadius: 24,
            offset: const Offset(0, 8),
            spreadRadius: 0,
          ),
        ],
        border: Border.all(
          color: isDark
              ? AppColors.accentDark.withValues(alpha: 0.2)
              : AppColors.accentLight.withValues(alpha: 0.1),
          width: 1,
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(
            isMobile ? AppTheme.radiusL : AppTheme.radiusXL),
        child: Container(
          padding: EdgeInsets.all(
              isMobile ? AppTheme.spacingL : AppTheme.spacingXXL),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header with icon
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.all(
                          isMobile ? AppTheme.spacingS : AppTheme.spacingM),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: isDark
                              ? [
                                  AppColors.accentDark,
                                  AppColors.accentDark.withValues(alpha: 0.8)
                                ]
                              : [
                                  AppColors.accentLight,
                                  AppColors.accentLight.withValues(alpha: 0.8)
                                ],
                        ),
                        borderRadius: BorderRadius.circular(
                            isMobile ? AppTheme.radiusS : AppTheme.radiusM),
                        boxShadow: [
                          BoxShadow(
                            color: (isDark
                                    ? AppColors.accentDark
                                    : AppColors.accentLight)
                                .withValues(alpha: 0.3),
                            blurRadius: 12,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Icon(
                        AppIcons.send,
                        color: AppColors.white,
                        size: isMobile ? (isSmallMobile ? 22 : 24) : 28,
                      ),
                    ),
                    SizedBox(
                        width:
                            isMobile ? AppTheme.spacingM : AppTheme.spacingL),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Send Me a Message',
                            style: AppFonts.h2().copyWith(
                              fontSize:
                                  isMobile ? (isSmallMobile ? 18 : 20) : null,
                              color: isDark
                                  ? AppColors.textPrimaryDark
                                  : AppColors.textPrimaryLight,
                              fontWeight: AppFonts.bold,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            'I\'ll get back to you within 24 hours',
                            style: AppFonts.bodySmall().copyWith(
                              fontSize:
                                  isMobile ? (isSmallMobile ? 10 : 11) : null,
                              color: isDark
                                  ? AppColors.textSecondaryDark
                                  : AppColors.textSecondaryLight,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                SizedBox(
                    height: isMobile ? AppTheme.spacingL : AppTheme.spacingXXL),

                // Name field - Required, basic validation
                ContactFormFieldWidget(
                  controller: _nameController,
                  label: 'Your Name',
                  hint: 'Enter your full name',
                  icon: AppIcons.user,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Please enter your name';
                    }
                    return null;
                  },
                ),

                const SizedBox(height: AppTheme.spacingL),

                // Email field - Required, validates email format with regex
                ContactFormFieldWidget(
                  controller: _emailController,
                  label: 'Your Email',
                  hint: 'Enter your email address',
                  icon: AppIcons.email,
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

                // Subject field - Required, basic validation
                ContactFormFieldWidget(
                  controller: _subjectController,
                  label: 'Subject',
                  hint: 'What is this about?',
                  icon: AppIcons.subject,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Please enter a subject';
                    }
                    return null;
                  },
                ),

                const SizedBox(height: AppTheme.spacingL),

                // Message field - Required, validates minimum length (10 chars)
                // Multi-line text area (5 lines)
                ContactFormFieldWidget(
                  controller: _messageController,
                  label: 'Message',
                  hint: 'Tell me about your project or inquiry...',
                  icon: AppIcons.message,
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

                SizedBox(
                    height: isMobile ? AppTheme.spacingL : AppTheme.spacingXXL),

                // Show success or error message after form submission
                if (_submitStatus != null) ...[
                  SubmitStatusWidget(statusMessage: _submitStatus!),
                  const SizedBox(height: AppTheme.spacingL),
                ],

                // Submit button - Shows loading indicator when submitting
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: _isSubmitting ? null : _submitForm,
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          isDark ? AppColors.accentDark : AppColors.accentLight,
                      foregroundColor: AppColors.white,
                      padding: EdgeInsets.symmetric(
                        vertical: isMobile
                            ? AppTheme.spacingM
                            : (AppTheme.spacingL + 4),
                      ),
                      elevation: 0,
                      shadowColor: (isDark
                              ? AppColors.accentDark
                              : AppColors.accentLight)
                          .withValues(alpha: 0.5),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            isMobile ? AppTheme.radiusS : AppTheme.radiusM),
                      ),
                    ),
                    child: _isSubmitting
                        ? SizedBox(
                            height: isMobile ? 20 : 24,
                            width: isMobile ? 20 : 24,
                            child: const CircularProgressIndicator(
                              strokeWidth: 3,
                              valueColor: AlwaysStoppedAnimation<Color>(
                                AppColors.white,
                              ),
                            ),
                          )
                        : Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(AppIcons.send,
                                  size: isMobile
                                      ? (isSmallMobile ? 16 : 18)
                                      : 20),
                              SizedBox(width: isMobile ? 6 : AppTheme.spacingS),
                              Text(
                                'Send Message',
                                style: AppFonts.button().copyWith(
                                  fontSize:
                                      isMobile ? (isSmallMobile ? 14 : 15) : 16,
                                  fontWeight: AppFonts.semiBold,
                                ),
                              ),
                            ],
                          ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Handles form submission with validation and error handling.
  ///
  /// Process:
  /// 1. Validates all form fields
  /// 2. Sets loading state
  /// 3. Creates ContactForm model from field values
  /// 4. Calls submission method (placeholder for API integration)
  /// 5. Shows success message and clears form, or shows error message
  Future<void> _submitForm() async {
    // Validate form before submission
    if (!_formKey.currentState!.validate()) return;

    // Set loading state
    setState(() {
      _isSubmitting = true;
      _submitStatus = null;
    });

    try {
      // Create ContactForm model from form data
      final contactForm = ContactForm(
        name: _nameController.text.trim(),
        email: _emailController.text.trim(),
        subject: _subjectController.text.trim(),
        message: _messageController.text.trim(),
      );

      // Submit the form (placeholder implementation)
      await _submitContactForm(contactForm);

      // Show success message
      setState(() {
        _submitStatus =
            'Message sent successfully! I\'ll get back to you soon.';
        _isSubmitting = false;
      });

      // Clear form fields after successful submission
      _nameController.clear();
      _emailController.clear();
      _subjectController.clear();
      _messageController.clear();
    } catch (e) {
      // Show error message if submission fails
      // Provide more helpful error message based on error type
      String errorMessage = 'Error sending message. ';

      if (e.toString().contains('timeout')) {
        errorMessage +=
            'Request timeout. Please check your internet connection and try again.';
      } else if (e.toString().contains('403') ||
          e.toString().contains('Access denied')) {
        errorMessage +=
            'Email service authentication issue. Please contact me directly at youssef.salem.hassan582@gmail.com';
      } else if (e.toString().contains('404')) {
        errorMessage +=
            'Email service configuration not found. Please contact me directly at youssef.salem.hassan582@gmail.com';
      } else if (e.toString().contains('400') ||
          e.toString().contains('Invalid')) {
        errorMessage +=
            'Invalid form data. Please check your inputs and try again.';
      } else if (e.toString().contains('500') ||
          e.toString().contains('server')) {
        errorMessage +=
            'Email service is temporarily unavailable. Please try again later or contact me directly at youssef.salem.hassan582@gmail.com';
      } else if (e.toString().contains('CORS') ||
          e.toString().contains('XMLHttpRequest')) {
        errorMessage +=
            'Browser security issue. Please try again or contact me directly at youssef.salem.hassan582@gmail.com';
      } else if (e.toString().contains('SocketException') ||
          e.toString().contains('network')) {
        errorMessage +=
            'Network connection issue. Please check your internet and try again.';
      } else {
        errorMessage +=
            'Please try again or contact me directly at youssef.salem.hassan582@gmail.com';
      }

      setState(() {
        _submitStatus = errorMessage;
        _isSubmitting = false;
      });
    }
  }

  /// Submits the contact form using Formspree (100% FREE, no domain restrictions!)
  ///
  /// This method sends an email to youssef.salem.hassan582@gmail.com
  /// using the Formspree service. Works on ANY domain without configuration.
  ///
  /// Formspree Setup Instructions:
  /// 1. Go to https://formspree.io/
  /// 2. Sign up for FREE account (no credit card needed)
  /// 3. Create a new form and get your Form ID (format: https://formspree.io/f/YOUR_FORM_ID)
  /// 4. Update the formspreeEndpoint in lib/config/api_keys.dart with your Form ID
  /// 5. That's it! No domain whitelisting needed - works everywhere!
  ///
  /// Free tier includes:
  /// - 50 submissions per month
  /// - No domain restrictions
  /// - Email notifications
  /// - File uploads
  Future<void> _submitContactForm(ContactForm form) async {
    try {
      // Formspree endpoint - FREE and works on any domain!
      const formspreeEndpoint = ApiKeys.formspreeEndpoint;

      // Check if endpoint is configured
      if (formspreeEndpoint.isEmpty) {
        throw Exception(
            'Formspree endpoint not configured. Please contact the administrator.');
      }

      // Create form data
      final formData = {
        'name': form.name,
        'email': form.email,
        'subject': form.subject,
        'message': form.message,
        '_replyto': form.email, // Formspree will use this as reply-to
        '_subject': '${form.subject} - Portfolio Contact Form',
      };

      // Send POST request to Formspree
      final response = await http
          .post(
        Uri.parse(formspreeEndpoint),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
        body: json.encode(formData),
      )
          .timeout(
        const Duration(seconds: 15),
        onTimeout: () {
          throw Exception('Request timeout. Please try again.');
        },
      );

      // Check response status
      if (response.statusCode == 200 || response.statusCode == 201) {
        // Success!
      } else if (response.statusCode == 422) {
        // Validation error
        final responseData = json.decode(response.body);
        final errors = responseData['errors'] as List?;
        final errorMessage = errors?.isNotEmpty == true
            ? errors!.first['message']
            : 'Invalid form data';
        throw Exception(errorMessage);
      } else if (response.statusCode == 403) {
        throw Exception(
            'Form is disabled or spam detected. Please contact me directly at ${ApiKeys.recipientEmail}');
      } else if (response.statusCode == 429) {
        throw Exception(
            'Too many requests. Please wait a moment and try again.');
      } else {
        throw Exception(
            'Failed to send message (Error ${response.statusCode}). Please try again or contact me directly at ${ApiKeys.recipientEmail}');
      }
    } catch (e) {
      // Parse error message for better user feedback
      final errorString = e.toString().toLowerCase();

      // Check for specific error types
      if (errorString.contains('timeout')) {
        throw Exception(
            'Request timeout. Please check your internet connection and try again.');
      } else if (errorString.contains('socketexception') ||
          errorString.contains('network')) {
        throw Exception(
            'Network error. Please check your internet connection and try again.');
      } else if (errorString.contains('format')) {
        throw Exception(
            'Invalid form data. Please check your inputs and try again.');
      }

      // Re-throw the exception to be caught by _submitForm
      rethrow;
    }
  }
}
